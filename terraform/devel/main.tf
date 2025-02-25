resource "aws_s3_bucket" "app_bucket" {
  bucket = "app-${var.environment}-jcduenasr"

  tags = {
    Name        = "app-${var.environment}-jcduenasr"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_ownership_controls" "app_bucket_ownership" {
  bucket = aws_s3_bucket.app_bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "app_bucket_block" {
  bucket = aws_s3_bucket.app_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "app_bucket_policy" {
  depends_on = [
    aws_s3_bucket_ownership_controls.app_bucket_ownership,
    aws_s3_bucket_public_access_block.app_bucket_block,
  ]  
  bucket = aws_s3_bucket.app_bucket.id
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": "${aws_s3_bucket.app_bucket.arn}/*"
        }
    ]
  })
}

resource "aws_s3_bucket_website_configuration" "app_bucket_website" {
  bucket = aws_s3_bucket.app_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

}