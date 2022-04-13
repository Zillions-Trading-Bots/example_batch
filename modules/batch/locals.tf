locals {
  region = var.aws_region

  vpc_defaults = {
    id = ""
  }
  vpc             = merge(local.vpc_defaults, var.vpc)
  use_default_vpc = local.vpc.id == ""

  log_group = {
    name              = "${var.app_name}-${var.service_name}-batch",
    retention_in_days = 7
  }

  tags_defaults = {
    "App"     = var.app_name
    "Service" = var.service_name
  }

  tags = merge(local.tags_defaults, local.tags_defaults)

  job_queue_name = "${var.app_name}-${var.service_name}-batch-job-queue"

}
