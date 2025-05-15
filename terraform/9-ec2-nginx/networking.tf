resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name      = "9-ec2-nginx"
    ManagedBy = "Terraform"
    Project   = "9-ec2-nginx"
  }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name      = "9-ec2-nginx-public"
    ManagedBy = "Terraform"
    Project   = "9-ec2-nginx"
  }
}