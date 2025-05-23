variable "aws_region" {
  type        = string
  default     = "ap-southeast-1"
  description = "The AWS region to deploy the resources in."
}

variable "ec2_instance_type" {
  type        = string
  default     = "t2.micro"
  description = "The type of the EC2 instance."

  validation {
    #condition     = var.ec2_instance_type == "t2.micro" || var.ec2_instance_type == "t3.micro"
    condition     = contains(["t2.micro", "t3.micro"], var.ec2_instance_type)
    error_message = "Only supports t2.micro and t3.micro."
  }
}

variable "ec2_volume_type" {
  type        = string
  description = "The volume type between gp2 and gp3."
}

variable "ec2_volume_size" {
  type        = number
  description = "The size in GB of the root block volume attached to the instance."
}