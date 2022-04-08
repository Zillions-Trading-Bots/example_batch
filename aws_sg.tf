resource "aws_security_group" "batch_example_fargate_sg" {
  name        = "batch_example_fargate_sg"
  description = "batch_example_fargate_sg"
  vpc_id      = var.vpc_id

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

  tags = var.default_tags


}
