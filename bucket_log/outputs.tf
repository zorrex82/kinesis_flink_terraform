output "bucket" {
  value       = aws_s3_bucket.this.bucket
  description = "Bucket Log information"
}
