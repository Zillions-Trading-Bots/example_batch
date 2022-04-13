resource "aws_batch_job_queue" "batch_example_job_queue" {
  name     = local.job_queue_name
  state    = "ENABLED"
  priority = 1
  compute_environments = [
    aws_batch_compute_environment.batch_example_fargate.arn,
  ]

  tags     = local.tags
  provider = aws

}
