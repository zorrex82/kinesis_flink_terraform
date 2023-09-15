resource "aws_cloudwatch_log_group" "log_group_s3" {
  name = local.name_cloudwatch_clg_s3
}

resource "aws_cloudwatch_log_stream" "log_stream_s3" {
  name           = local.name_cloudwatch_cls_s3
  log_group_name = aws_cloudwatch_log_group.log_group_s3.name
}

