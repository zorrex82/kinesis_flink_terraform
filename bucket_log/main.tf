
resource "aws_s3_bucket" "this" {
  bucket = local.log_bucket_name

  lifecycle_rule {
    id      = "log-cleanup"
    enabled = true
    prefix  = var.logging_config.prefix

    transition {
      days          = var.logging_config.lifecycle_thresholds[0]
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = var.logging_config.lifecycle_thresholds[1]
      storage_class = "GLACIER"
    }

    expiration {
      days = var.logging_config.lifecycle_thresholds[2]
    }
  }

  tags = {
    Name = local.log_bucket_name
  }
}

resource "aws_s3_bucket_public_access_block" "log_bucket_public_access_block" {
  count                   = var.logging_enable ? 1 : 0
  bucket                  = aws_s3_bucket.this.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}


resource "aws_s3_bucket_server_side_encryption_configuration" "log_bucket_encrypt" {
  bucket = aws_s3_bucket.this.bucket
  rule {
    bucket_key_enabled = local.sse_config.bucket_key_enabled
    apply_server_side_encryption_by_default {
      sse_algorithm = local.sse_config.sse_algorithm
    }
  }
}

