data "aws_ami" "ubuntu" {
  #provider    = aws.ap-southeast-2
  most_recent = true

  owners = ["099720109477"] # Canonical
  #owners = ["679593333241"] # Bitnami
  #owners = ["amazon"]       # Amazon
  #owners = ["self"]         # Your own AMIs

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_ami" "ubuntu2" {
  provider    = aws.ap-southeast-2
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


output "ubuntu-ami-test" {
  value = data.aws_ami.ubuntu.id
}


output "ubuntu-ami-test-2" {
  value = data.aws_ami.ubuntu2.id
}

resource "aws_instance" "web" {
  # https://cloud-images.ubuntu.com/locator/ec2/
  #ami = "ami-0892da582b5039419"
  #ami                         = "ami-03fbeeb6982ed9f9f" # Bitnami nginx
  ami                         = data.aws_ami.ubuntu.id
  associate_public_ip_address = true
  instance_type               = "t2.micro"
}