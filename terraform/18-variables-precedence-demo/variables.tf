variable "aws_region" {
  type        = string
  default     = "ap-southeast-1"
  description = "The AWS region to deploy the resources in."
}

variable "ec2_instance_type" {
  type        = string
  description = "The type of the EC2 instance."

  validation {
    condition     = startswith(var.ec2_instance_type, "t3")
    error_message = "Only t3 instance types are allowed."
  }
}

variable "ec2_volume_config" {
  type = object({
    size = number
    type = string
  })

  description = "The size and type of the root block volume attached to the instance."

  default = {
    size = 1
    type = "gp2"
  }
}

variable "additional_tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags to apply to the resources."
}