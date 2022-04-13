resource "aws_security_group" "batch_example_fargate_sg" {
  name        = "${var.app_name}-${var.service_name}_fargate_sg"
  description = "${var.app_name}-${var.service_name}_fargate_sg"
  vpc_id      = local.vpc.id

  ingress = [
    {
      description      = "All Trafic"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  egress = [
    {
      description      = "All Trafic"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  tags = local.tags


}
