locals {
  region = var.aws_region

  vpc_defaults = {
    id = ""
  }
  vpc             = merge(local.vpc_defaults, var.vpc)
  use_default_vpc = local.vpc.id == ""

  log_group = {
    name              = var.log_group_name,
    retention_in_days = 7
  }
}
