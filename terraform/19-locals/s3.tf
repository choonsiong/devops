resource "aws_s3_bucket" "project_bucket" {
  bucket = "${local.project}-bucket"

  tags = merge(local.common_tags, var.additional_tags)
}