resource "aws_iam_role" "kinesis_firehose_service_role" {
  name               = local.name_role
  description        = "Role de serviço do Kinesis Firehose"
  assume_role_policy = data.aws_iam_policy_document.kinesis_firehose_assume_role.json
  tags = {
    Name = local.name_role
  }
}

resource "aws_iam_policy" "firehose_s3" {
  name_prefix = local.name_policy
  policy      = data.aws_iam_policy_document.firehose_s3.json
}

resource "aws_iam_role_policy_attachment" "firehose_s3" {
  role       = aws_iam_role.kinesis_firehose_service_role.name
  policy_arn = aws_iam_policy.firehose_s3.arn
}

resource "aws_iam_policy" "put_record" {
  name_prefix = local.name_policy
  policy      = data.aws_iam_policy_document.put_record.json
}

resource "aws_iam_role_policy_attachment" "put_record" {
  role       = aws_iam_role.kinesis_firehose_service_role.name
  policy_arn = aws_iam_policy.put_record.arn
}

resource "aws_iam_policy" "glue_get_table" {
  name_prefix = local.name_policy
  policy      = data.aws_iam_policy_document.glue_get_table.json
}

resource "aws_iam_role_policy_attachment" "glue_get_table" {
  role       = aws_iam_role.kinesis_firehose_service_role.name
  policy_arn = aws_iam_policy.glue_get_table.arn
}

resource "aws_iam_policy" "kinesis_firehose" {
  name_prefix = local.name_policy
  policy      = data.aws_iam_policy_document.kinesis_firehose.json
}

resource "aws_iam_role_policy_attachment" "kinesis_firehose" {
  role       = aws_iam_role.kinesis_firehose_service_role.name
  policy_arn = aws_iam_policy.kinesis_firehose.arn
}
