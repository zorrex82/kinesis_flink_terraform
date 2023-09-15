output "bucket" {
  value       = aws_s3_bucket.this.bucket
  description = "Bucket information"
}

output "app_policy" {
  value       = var.create_app_policy ? aws_iam_policy.app_policy[0] : null
  description = "Access policy for applications."
}

output "arn" {
  value       = aws_s3_bucket.this.arn
  description = "Bucket ARN Information"
}
