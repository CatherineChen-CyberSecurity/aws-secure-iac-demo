terraform {
  backend "s3" {}
}

resource "aws_s3_bucket" "secure_bucket" {
  bucket = var.bucket_name
  force_destroy = true # Allows deletion of non-empty buckets, use only dev/staging environments

  tags = {
    Environment = var.environment
    Project     = var.project
  }
}

resource "aws_s3_bucket_public_access_block" "block" {
  bucket = aws_s3_bucket.secure_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "default" {
  bucket = aws_s3_bucket.secure_bucket.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}