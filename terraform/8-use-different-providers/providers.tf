terraform {
  required_version = "~> 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

provider "aws" {
  region = "ap-southeast-2"
  alias  = "apsoutheast2"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-bucket-name-1"
}

resource "aws_s3_bucket" "my_bucket_ap_southeast_2" {
  bucket   = "my-unique-bucket-name-2"
  provider = aws.apsoutheast2
}