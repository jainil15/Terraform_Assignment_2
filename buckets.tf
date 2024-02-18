# Creating S3 bucket
resource "aws_s3_bucket" "jainils_223" {
  bucket = var.s3_name
  tags = {
    Name = "${var.s3_name}"
  }

}
