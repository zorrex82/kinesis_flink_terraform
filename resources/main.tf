# Setup buckets
module "bucket_log" {
  source      = "../bucket_log"
  name        = var.bucket_log["name"]
  environment = var.bucket_log["env"]
}

module "bucket_raw" {
  source      = "../bucket_s3"
  name        = var.bucket_raw["name"]
  environment = var.bucket_raw["env"]
  bucket_log  = module.bucket_log.bucket
}

module "bucket_code" {
  source      = "../bucket_s3"
  name        = var.bucket_code["name"]
  environment = var.bucket_code["env"]
}

resource "aws_s3_object" "this" {
  bucket = module.bucket_code.bucket.bucket
  key    = "code_deployment.zip"
  source = "../deployment_files/code_deployment.zip"
}

module "glue_catalog_database" {
  source      = "../glue_catalog_database"
  name        = var.glue_catalog_database["name"]
  environment = var.glue_catalog_database["env"]
}

module "glue_catalog_table" {
  source        = "../glue_catalog_table"
  name          = var.glue_catalog_table["name"]
  environment   = var.glue_catalog_table["env"]
  table_columns = var.table_columns
}

module "aws_kinesis_stream_output" {
  source      = "../kinesis_stream"
  environment = var.kinesis_stream["env"]
  name        = var.kinesis_stream["name"]
}

module "flink_analytics" {
  source             = "../kinesis_analytics"
  environment        = var.kinesis_analytics["env"]
  name               = var.kinesis_analytics["name"]
  input_stream_arn   = "arn:aws:kinesis:us-east-1:654153040741:stream/input-test" # need to fullfill with the right arn for your application
  output_stream_arn  = module.aws_kinesis_stream_output.kinesis_stream_application.arn
  s3_bucket_code_arn = module.bucket_code.bucket.arn
  property_group = [
    {
      property_group_id = "kinesis.analytics.flink.run.options"
      property_map = {
        "python"  = "code_deployment/source/main.py",
        "jarfile" = "code_deployment/lib/PythonApplicationDependencies.jar"
      }
    },
    {
      property_group_id = "config.table.input"
      property_map = {
        "connector" = "kinesis",
        "stream"    = "input-test",
        "region"    = "us-east-1",
        "name"      = "data_stream"
      }
    },
    {
      property_group_id = "config.table.output"
      property_map = {
        "connector" = "kinesis",
        "stream"    = module.aws_kinesis_stream_output.name,
        "region"    = "us-east-1",
        "name"      = "output_stream"
      }
    }
  ]
  s3_content_location = {
    bucket_arn = module.bucket_code.bucket.arn
    file_key   = aws_s3_object.this.key
  }
}

module "kinesis_firehose" {
  source                           = "../kinesis_firehose"
  environment                      = var.kinesis_firehose["env"]
  name                             = var.kinesis_firehose["name"]
  s3_bucket_arn                    = module.bucket_raw.bucket.arn
  kinesis_source_configuration_arn = module.aws_kinesis_stream_output.kinesis_stream_application.arn
  data_format_conversion_configuration = [
    {
      enabled = true
      input_format_configuration = {
        deserializer = {
          hive_json_ser_de = [{}]
        }
      }
      output_format_configuration = {
        serializer = {
          parquet_ser_de = [{
            compression = "SNAPPY"
          }]
        }
      }
      schema_configuration = {
        database_name = aws_glue_catalog_database.this.name
        table_name    = aws_glue_catalog_table.this.name
        role_arn      = aws_iam_role.this.arn
      }
    }
  ]
}
