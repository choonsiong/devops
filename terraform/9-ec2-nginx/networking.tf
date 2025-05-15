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

resource "aws_internet_gateway" "main_igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name      = "9-ec2-nginx-igw"
    ManagedBy = "Terraform"
    Project   = "9-ec2-nginx"
  }
}

resource "aws_route_table" "main_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main_igw.id
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.main_rt.id
}