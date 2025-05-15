resource "aws_instance" "web" {
  # https://cloud-images.ubuntu.com/locator/ec2/
  ami = "ami-0892da582b5039419"
  associate_public_ip_address = true
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public.id
}