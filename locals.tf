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

  job_queue_name = "${var.app_name}-${var.service_name}-batch-job-queue"

}
