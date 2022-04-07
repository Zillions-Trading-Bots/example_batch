resource "aws_batch_compute_environment" "devops_batch_example_fargate_virginia" {
  compute_environment_name = var.compute_environment_name

  compute_resources {
    max_vcpus          = 16
    security_group_ids = [ aws_security_group.devops_batch_example_fargate_sg.id ]
    subnets            = var.compute_environment_subnets_virginia
    type               = "FARGATE"
  }

  service_role =  aws_iam_role.devops-batch-example-service-role.arn
  type         = "MANAGED"

  tags = local.default_tags

  provider = aws
}
