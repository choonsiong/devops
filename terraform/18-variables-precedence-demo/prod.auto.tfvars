ec2_instance_type = "t3.large" # This will override the environment variable and terraform.tfvars

additional_tags = {
  ValuesFrom = "prod-override.auto.tfvars"
}