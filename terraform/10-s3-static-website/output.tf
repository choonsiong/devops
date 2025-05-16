output "s3_static_website_endpoint" {
  value = aws_s3_bucket_website_configuration.s3_static_website.website_endpoint
}