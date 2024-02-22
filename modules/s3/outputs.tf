output "s3_id" {
  value       = aws_s3_bucket.this.id
  description = "S3 ID"
}

output "s3_ver_id" {
  value       = aws_s3_bucket_versioning.this.id
  description = "S3 Versioning ID"
}
