# Creating S3 bucket
resource "aws_s3_bucket" "jainils_223" {
  bucket = "jainils-aws-s3-bucket-223"
  tags = {
    Name        = "jainils_aws_s3_bucket_223"
    Environment = "Dev"
  }

}