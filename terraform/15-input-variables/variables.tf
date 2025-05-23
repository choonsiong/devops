variable "aws_region" {
  type        = string
  default     = "ap-southeast-1"
  description = "The AWS region to deploy the resources in."
}

variable "ec2_instance_type" {
  type        = string
  default     = "t2.micro"
  description = "The type of the EC2 instance."
}

variable "ec2_volume_type" {
  type        = string
  description = "The volume type between gp2 and gp3."
}

variable "ec2_volume_size" {
  type        = number
  description = "The size in GB of the root block volume attached to the instance."
}