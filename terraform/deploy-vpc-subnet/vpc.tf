terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
      }
    }
}

resource "aws_vpc" "terraform_demo_vpc" {
  cidr_block = "10.1.0.0/16"
}

resource "aws_subnet" "terraform_public_subnet" {
    vpc_id = aws_vpc.terraform_demo_vpc
    cidr_block = "10.1.0.0/24"
}

resource "aws_subnet" "terraform_private_subnet" {
    vpc_id = aws_vpc.terraform_demo_vpc
    cidr_block = "10.1.1.0/24"
}

resource "aws_internet_gateway" "terraform_igw" {
    vpc_id = aws_vpc.terraform_demo_vpc
}