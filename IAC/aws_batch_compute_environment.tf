resource "aws_batch_compute_environment" "batch_example_fargate" {
  compute_environment_name = var.compute_environment_name

  compute_resources {
    max_vcpus          = 16
    security_group_ids = [aws_security_group.batch_example_fargate_sg.id]
    subnets            = var.compute_environment_subnets
    type               = "FARGATE"
  }

  service_role = aws_iam_role.batch-example-service-role.arn
  type         = "MANAGED"

  tags = var.default_tags

  provider = aws
}
