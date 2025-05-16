resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "s3_static_website" {
  bucket = "lcs-s3-static-website-${random_id.bucket_suffix.hex}"
}

# allow public access to the bucket
resource "aws_s3_bucket_public_access_block" "s3_static_website_allow_public_access" {
  bucket                  = aws_s3_bucket.s3_static_website.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# allow public read access to the bucket
resource "aws_s3_bucket_policy" "s3_static_website_allow_public_read" {
  bucket = aws_s3_bucket.s3_static_website.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.s3_static_website.arn}/*"
      }
    ]
  })
}