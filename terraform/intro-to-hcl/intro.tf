terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
      }
    }
}

provider "aws" {
    region = "ap-southeast-1"
}

# Actively managed by us, by our terraform project
resource "aws_s3_bucket" "terraform_s3_bucket" {
    #bucket = "my-terraform-bucket"
    bucket = var.my_bucket_name
}

# Managed somewhere else, we just want to use it in our project
data "aws_s3_bucket" "terraform_external_bucket" {
    bucket = "my-data-bucket"
}

variable "my_bucket_name" {
    type = string
    description = "My variable used to set bucket name"
    default = "my_default_bucket_name"
}

output "bucket_id" {
    value = aws_s3_bucket.terraform_s3_bucket.id
}

locals {
    local_example = "This is a local variable"
}

module "my_module" {
    source = "./module-example"
}