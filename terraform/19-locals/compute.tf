locals {
  project       = "my-project"
  project_owner = "foobar"
  cost_center   = "1234"
  managed_by    = "Terraform"
}

locals {
  common_tags = {
    Project      = local.project
    ProjectOwner = local.project_owner
    CostCenter   = local.cost_center
    ManagedBy    = local.managed_by
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  owners = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "compute" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.ec2_instance_type

  root_block_device {
    delete_on_termination = true
    volume_type           = var.ec2_volume_config.type
    volume_size           = var.ec2_volume_config.size
  }

  tags = merge(local.common_tags, var.additional_tags, {
    ManagedBy = local.managed_by
  })
}