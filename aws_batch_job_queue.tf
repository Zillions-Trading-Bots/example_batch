resource "aws_batch_job_queue" "devops_batch_example_job_queue_virginia_python" {
  name     = var.job_queue_name_python
  state    = "ENABLED"
  priority = 1
  compute_environments = [
    aws_batch_compute_environment.devops_batch_example_fargate_virginia.arn,
  ]

  tags = local.default_tags

  provider = aws

}

resource "aws_batch_job_queue" "devops_batch_example_job_queue_virginia_dotnet" {
  name     = var.job_queue_name_dotnet
  state    = "ENABLED"
  priority = 1
  compute_environments = [
    aws_batch_compute_environment.devops_batch_example_fargate_virginia.arn,
  ]

  tags = local.default_tags

  provider = aws

}
