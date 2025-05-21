data "aws_ami" "ubuntu" {
  most_recent = true

  owners = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_iam_policy_document" "static_website" {
  statement {
    sid = "PublicReadGetObject"
    principals {
      type        = "*"
      identifiers = ["*"]
    }
    actions = ["s3:GetObject"]
    resources = [
      "${aws_s3_bucket.public_read_bucket.arn}/*"
    ]
  }
}

# This vpc is managed manually on AWS console, we just 'use it' here
data "aws_vpc" "prod_vpc" {
  tags = {
    Env = "prod-vpc"
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_caller_identity" "current" {}

data "aws_region" "current" {
  #provider = aws.ap-southeast-2
}

output "iam_policy" {
  value = data.aws_iam_policy_document.static_website
}

output "prod_vpc_id" {
  value = data.aws_vpc.prod_vpc.id
}

output "aws_availability_zones" {
  value = data.aws_availability_zones.available
}

output "ubuntu-ami-test" {
  value = data.aws_ami.ubuntu.id
}

output "aws_caller_identity" {
  value = data.aws_caller_identity.current
}

output "aws_region" {
  value = data.aws_region.current
}

resource "aws_instance" "web" {
  ami                         = data.aws_ami.ubuntu.id
  associate_public_ip_address = true
  instance_type               = "t2.micro"
}

resource "aws_s3_bucket" "public_read_bucket" {
  bucket = "lcs-data-source-demo-bucket"
}