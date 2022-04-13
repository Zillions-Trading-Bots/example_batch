resource "aws_cloudwatch_log_group" "example" {
  name              = local.log_group.name
  retention_in_days = local.log_group.retention_in_days
}


resource "aws_batch_job_definition" "batch_example_jobdef" {
  name = "${var.app_name}_job_definition"
  type = "container"
  platform_capabilities = [
    "FARGATE",
  ]

  #"command"     : ["python","entry_shell.py","inverso","123"],
  container_properties = <<CONTAINER_PROPERTIES
{
  "command"     : [echo, "hello world"],
  "image"       : "${var.job_definition_image_full_url}",
  "fargatePlatformConfiguration": {
    "platformVersion": "LATEST"
  },
  "resourceRequirements": [
    {"type": "VCPU", "value": "${var.job_definition_resource_vcpu}"},
    {"type": "MEMORY", "value": "${var.job_definition_resource_memory}"}
  ],
  "executionRoleArn": "${aws_iam_role.batch-example-execution-role.arn}",
  "jobRoleArn": "${aws_iam_role.batch-example-job-role.arn}",
  "networkConfiguration": { 
    "assignPublicIp": "ENABLED"
  }
  ,"logConfiguration": { 
    "logDriver": "awslogs",
    "options": {
      "awslogs-group": "${aws_cloudwatch_log_group.example.name}",
      "awslogs-region": "${var.aws_region}",
      "awslogs-stream-prefix": "${local.log_group.name}"
    }    
  }  
}
CONTAINER_PROPERTIES

  tags     = var.tags
  provider = aws
}
