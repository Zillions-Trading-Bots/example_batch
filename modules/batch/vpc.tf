data "aws_vpc" "vpc" {
  id      = local.use_default_vpc ? null : local.vpc["id"]
  default = local.use_default_vpc
}

data "aws_subnets" "existing_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
}

data "aws_subnet" "subnets" {
  for_each = toset(data.aws_subnets.existing_subnets.ids)
  id       = each.value
}
