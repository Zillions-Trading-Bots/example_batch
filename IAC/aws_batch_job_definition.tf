resource "aws_batch_job_definition" "batch_example_jobdef" {
  name = "batch_example_jobdefinition"
  type = "container"
  platform_capabilities = [
    "FARGATE",
  ]

  container_properties = <<CONTAINER_PROPERTIES
{
  "command"     : ["server.py", "inversor", "123"],
  "image"       : "${var.job_definition_image_full_url}",
  "fargatePlatformConfiguration": {
    "platformVersion": "LATEST"
  },
  "resourceRequirements": [
    {"type": "VCPU", "value": "${var.job_definition_resource_vcpu}"},
    {"type": "MEMORY", "value": "${var.job_definition_resource_memory}"}
  ],
  "executionRoleArn": "${aws_iam_role.batch-example-execution-role.arn}",
  "jobRoleArn": "${aws_iam_role.batch-example-job-role.arn}"
}
CONTAINER_PROPERTIES
  tags                 = var.default_tags

  provider = aws
}
