# This file is used to override the default values in the terraform.tfvars file.
# Also, this file overrides the dev-override.auto.tfvars file because 'p' after 'd' in the alphabet.
ec2_instance_type = "t3.micro"

additional_tags = {
  ValuesFrom = "prod-override.auto.tfvars"
}