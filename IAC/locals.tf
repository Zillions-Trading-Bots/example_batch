locals {
  region = var.aws_region

  lb_defaults = {
    name     = "tf-alb"
    internal = false
    target_group = {
      name     = "tf-alb-tg"
      port     = 80
      protocol = "HTTP"
    }
  }
  lb = merge(local.lb_defaults, var.lb_values)

  vpc_defaults = {
    id = ""
  }
  vpc             = merge(local.vpc_defaults, var.vpc)
  use_default_vpc = local.vpc.id == ""

  container_defaults = {
    name  = "application"
    image = "particule/helloworld"
    ports = [5000]
  }
  container = merge(local.container_defaults, var.container)
}
