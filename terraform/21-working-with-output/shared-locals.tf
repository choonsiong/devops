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