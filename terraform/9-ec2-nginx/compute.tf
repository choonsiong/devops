resource "aws_instance" "web" {
  # https://cloud-images.ubuntu.com/locator/ec2/
  ami = "ami-0892da582b5039419"
  #ami                         = "ami-03fbeeb6982ed9f9f" # Bitnami nginx
  associate_public_ip_address = true
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.public_http_traffic.id]

  tags = merge(local.common_tags, {
    Name = "9-ec2-nginx-ec2"
  })

  lifecycle {
    # This will create the new instance first then only destroy the old instance
    create_before_destroy = true
    ignore_changes        = [tags] # ignore tag changes make manually (e.g., on AWS website directly)
  }
}

resource "aws_security_group" "public_http_traffic" {
  description = "Security group allowing traffic on ports 443 and 80"
  name        = "public-http-traffic-sg"
  vpc_id      = aws_vpc.main.id

  tags = merge(local.common_tags, {
    Name = "9-ec2-nginx-sg"
  })
}

resource "aws_vpc_security_group_ingress_rule" "http_ingress" {
  security_group_id = aws_security_group.public_http_traffic.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "https_ingress" {
  security_group_id = aws_security_group.public_http_traffic.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
}

