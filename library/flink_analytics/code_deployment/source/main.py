import os

from flink_environment import st_env
from flink_udfs import kinesis_analytics_register_udfs
from pyflink.table import StreamTableEnvironment
from util import get_application_properties, logger, property_map, column_def, column_map, load_transformations


class main:
    def __init__(self, st_env: StreamTableEnvironment) -> None:
        self.st_env = st_env

    def get_files(self) -> str:
        kinesis_analytics_register_udfs(self.st_env)

        properties = "/etc/flink/application_properties.json"
        self.props = get_application_properties(properties)
        cols_input = "/etc/flink/columns_definitions_input.json"
        self.cols_input = column_map(cols_input)
        cols_output = "/etc/flink/columns_definitions_output.json"
        self.cols_output = column_map(cols_output)
        logger.info("Execute Cloud")

    def create_input_table(self) -> None:
        config = "config.table.input"
        nmtable = property_map(self.props, config)["name"]
        connector = property_map(self.props, config)["connector"]
        stream = property_map(self.props, config)["stream"]
        region = property_map(self.props, config)["region"]
        column_definitions = column_def(self.cols_input)

        drop_ddl_input = f"DROP TABLE IF EXISTS {nmtable}"
        create_ddl_input = f"""
                            CREATE TABLE {nmtable} (
                            {column_definitions}
                            )
                            WITH (
                                   'connector' = '{connector}',
                                   'stream' = '{stream}',
                                   'aws.region' = '{region}',
                                   'scan.stream.initpos' = 'LATEST',
                                   'format' = 'json',
                                   'json.timestamp-format.standard' = 'ISO-8601')
                            """

        self.st_env.execute_sql(drop_ddl_input)
        self.st_env.execute_sql(create_ddl_input)
        logger.info("Create Input Table")

    def create_ouput_table(self) -> None:
        config = "config.table.output"
        nmtable = property_map(self.props, config)["name"]
        connector = property_map(self.props, config)["connector"]
        column_definitions = column_def(self.cols_output)

        if connector == "filesystem":
            format = property_map(self.props, config)["format"]
            path = property_map(self.props, config)["path"]

            create_ddl_output = f"""
                                CREATE TABLE {nmtable} (
                                {column_definitions}        
                                )
                                WITH (
                                    'connector' = '{connector}',
                                    'format' = '{format}',
                                    'path' = 's3a://{path}/{nmtable}',
                                    'sink.partition-commit.policy.kind' = 'success-file',
                                    'sink.partition-commit.delay' = '1 min'
                                    )
                                """
        else:
            stream = property_map(self.props, config)["stream"]
            region = property_map(self.props, config)["region"]
            create_ddl_output = f"""
                            CREATE TABLE {nmtable} (
                            {column_definitions}
                            )
                            WITH (
                                'connector' = '{connector}',
                                'stream' = '{stream}',
                                'aws.region' = '{region}',
                                'scan.stream.initpos' = 'LATEST',
                                'sink.producer.collection-max-count' = '100',
                                'sink.partitioner-field-delimiter' = ';',
                                'format' = 'json',
                                'json.timestamp-format.standard' = 'ISO-8601'
                                )
                            """

        self.st_env.execute_sql(create_ddl_output)
        logger.info("Create Output Table")
        logger.info(create_ddl_output)

    def execute_rule(self) -> None:

        config_in_tb = "config.table.input"
        config_out_tb = "config.table.output"
        config_exec = "config.execution.prop"

        nmtablein = property_map(self.props, config_in_tb)["name"]
        nmtableout = property_map(self.props, config_out_tb)["name"]

        extract_json = property_map(self.props, config_exec)["extract_json"]
        partition = property_map(self.props, config_exec)["partition"]
        group = property_map(self.props, config_exec)["group"]
        code = property_map(self.props, config_exec)["code"]
        order = property_map(self.props, config_exec)["order"]

        sql_agg = f"""
              SELECT *
              FROM (
              SELECT {partition},
                     {order},
                     {group},
                     LISTAGG(CAST({group} AS STRING),',') OVER w as SupsectIds,
                     COUNT(DISTINCT {group}) OVER w as qtdSuspects
              FROM (
              SELECT * ,
                     get_value('{extract_json}', input) as {extract_json}
              FROM {nmtablein}
              WHERE code = '{code}'
              )
              WINDOW w AS (
              PARTITION BY {partition}
              ORDER BY {order}
              )
              )
              WHERE qtdSuspects > 1
              """

        exec_sql = self.st_env.sql_query(sql_agg)

        if self.is_local:
            logger.info("Execute Local")
            insert = exec_sql.execute_insert(nmtableout)
            insert.wait()
        else:
            insert = exec_sql.execute_insert(nmtableout)
            status = insert.get_job_client().get_job_status()
            logger.info(f"Status: {status}")

 
    def execute_rule(self) -> None:
        path_etl = "/etc/flink/transformations.json"
        config_data = load_transformations(path_etl)

        source_table = config_data["source_table"]
        destination_table = config_data["destination_table"]
        filter_condition = config_data["filter_condition"]
        columns = config_data["columns"]

        sql_agg = self.create_dynamic_sql(source_table, filter_condition, columns)

        exec_sql = self.st_env.sql_query(sql_agg)

        insert = exec_sql.execute_insert(destination_table)
        status = insert.get_job_client().get_job_status()
        logger.info(f"Status: {status}")

    def create_dynamic_sql(
        self, source_table, filter_condition, columns
    ) -> str:
        column_expressions = [
            f"{col['expression']} AS {col['name']}" for col in columns
        ]

        column_list = ",\n".join(column_expressions)

        return f"""
            SELECT {column_list}
            FROM "{source_table}"
            WHERE {filter_condition}
        """   

    def __call__(self) -> None:
        self.get_files()
        self.create_input_table()
        self.create_ouput_table()
        self.execute_rule()
        self.st_env.execute("JobDetectFraud")


if __name__ == "__main__":
    main_exec = main(st_env)
    main_exec()
