# 1. Plan
# 2. Apply
# 3. Destroy

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

resource "aws_vpc" "terraform_demo_vpc" {
  cidr_block = "10.1.0.0/16"

  tags = {
    Name = "Terraform VPC"
  }
}

resource "aws_subnet" "terraform_public_subnet" {
    vpc_id = aws_vpc.terraform_demo_vpc.id
    cidr_block = "10.1.0.0/24"
}

resource "aws_subnet" "terraform_private_subnet" {
    vpc_id = aws_vpc.terraform_demo_vpc.id
    cidr_block = "10.1.1.0/24"
}

resource "aws_internet_gateway" "terraform_igw" {
    vpc_id = aws_vpc.terraform_demo_vpc.id
}

resource "aws_route_table" "terraform_public_rtb" {
    vpc_id = aws_vpc.terraform_demo_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.terraform_igw.id
    }
}

resource "aws_route_table_association" "terraform_public_subnet_1" {
    subnet_id = aws_subnet.terraform_public_subnet.id
    route_table_id = aws_route_table.terraform_public_rtb.id
}
