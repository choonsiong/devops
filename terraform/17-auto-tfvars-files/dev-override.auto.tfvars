# This file is used to override the default values in the terraform.tfvars file.
ec2_instance_type = "t2.micro"

additional_tags = {
  ValuesFrom = "dev-override.auto.tfvars"
}