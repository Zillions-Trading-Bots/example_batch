resource "aws_batch_job_definition" "devops_batch_example_jobdef_virginia_python" {
  name = "devops_batch_example_jobdefinition_python"
  type = "container"
  platform_capabilities = [
    "FARGATE",
  ]

  container_properties = <<CONTAINER_PROPERTIES
{
  "command"     : ["server.py", "Argumentos", "que serão passados", "por argv para python"],
  "image"       : "busybox",
  "fargatePlatformConfiguration": {
    "platformVersion": "LATEST"
  },
  "resourceRequirements": [
    {"type": "VCPU", "value": "${var.job_definition_resource_vcpu}"},
    {"type": "MEMORY", "value": "${var.job_definition_resource_memory}"}
  ],
  "executionRoleArn": "${aws_iam_role.devops-batch-example-execution-role.arn}",
  "jobRoleArn": "${aws_iam_role.devops-batch-example-job-role.arn}"
}
CONTAINER_PROPERTIES
  tags                 = local.default_tags

  provider = aws
}

resource "aws_batch_job_definition" "devops_batch_example_jobdef_virginia_dotnet" {
  name = "devops_batch_example_jobdefinition_dotnet"
  type = "container"
  platform_capabilities = [
    "FARGATE",
  ]

  container_properties = <<CONTAINER_PROPERTIES
{
  "command"     : ["MyApp.dll", "Argumentos", "que serão passados", "por argv para dotnet"],
  "image"       : "busybox",
  "fargatePlatformConfiguration": {
    "platformVersion": "LATEST"
  },
  "resourceRequirements": [
    {"type": "VCPU", "value": "${var.job_definition_resource_vcpu}"},
    {"type": "MEMORY", "value": "${var.job_definition_resource_memory}"}
  ],
  "executionRoleArn": "${aws_iam_role.devops-batch-example-execution-role.arn}",
  "jobRoleArn": "${aws_iam_role.devops-batch-example-job-role.arn}"
}
CONTAINER_PROPERTIES
  tags                 = local.default_tags

  provider = aws
}
