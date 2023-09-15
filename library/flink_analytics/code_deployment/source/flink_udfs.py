from pyflink.common import Row
from pyflink.table import DataTypes
from pyflink.table.udf import udf


@udf(result_type=DataTypes.STRING())
def get_value(key: str, json_value: str) -> Row:
    if json_value and json_value.find(key) >= 0:
        return json_value.split(f'{key}":"')[1].split('"')[0]


def kinesis_analytics_register_udfs(st_env) -> None:
    st_env.register_function("get_value", get_value)
