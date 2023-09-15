resource "aws_kinesis_stream" "this" {
  name             = local.name
  shard_count      = 2
  retention_period = 48

  tags = var.tags

}
