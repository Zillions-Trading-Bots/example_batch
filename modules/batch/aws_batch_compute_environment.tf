resource "aws_batch_compute_environment" "batch_example_fargate" {
  compute_environment_name = var.app_name

  compute_resources {
    max_vcpus          = 30
    security_group_ids = [aws_security_group.batch_example_fargate_sg.id]
    subnets            = [for s in data.aws_subnet.subnets : s.id]
    type               = "FARGATE"
  }

  service_role = aws_iam_role.aws_batch_service_role.arn
  type         = "MANAGED"

  tags       = local.tags
  provider   = aws
  depends_on = [aws_iam_role_policy_attachment.aws_batch_service_role_attachment]
}
