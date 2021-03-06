resource "aws_iam_role" "batch-example-execution-role" {
  name = "${var.app_name}-${var.service_name}-execution-role"
  path = "/"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
              "Service": [
                "ecs-tasks.amazonaws.com"
              ]

            },
            "Effect": "Allow"
        }
    ]
}
EOF
}

# AWS managed policies
resource "aws_iam_role_policy_attachment" "awsbatch_role_policy_attachment_execution_role" {
  role       = aws_iam_role.batch-example-execution-role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_iam_role" "batch-example-job-role" {
  name = "${var.app_name}-${var.service_name}-job-role"
  path = "/"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
              "Service": [
                "ecs.amazonaws.com",
                "ecs-tasks.amazonaws.com"
              ]

            },
            "Effect": "Allow"
        }
    ]
}
EOF
}


# AWS managed policies
resource "aws_iam_role_policy_attachment" "awsbatch_role_policy_attachment_job_role" {
  role       = aws_iam_role.batch-example-job-role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}



resource "aws_iam_role" "aws_batch_service_role" {
  name = "${var.app_name}-${var.service_name}-service-role"
  path = "/"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
              "Service": [
                "batch.amazonaws.com"
              ]

            },
            "Effect": "Allow"
        }
    ]
}
EOF
}

# AWS managed policies
resource "aws_iam_role_policy_attachment" "aws_batch_service_role_attachment" {
  role       = aws_iam_role.aws_batch_service_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBatchServiceRole"
}


resource "aws_iam_policy" "example_batch_policy_for_logs" {
  name        = "${var.app_name}-${var.service_name}-logs"
  description = "${var.app_name}-${var.service_name} logs"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "logs:*",
                "cloudwatch:*"
            ],
            "Resource": [
                "*"
            ]
        }
    ]
}
EOF
}
resource "aws_iam_policy_attachment" "example-batch-logs-attachment" {
  name       = "${var.app_name}-${var.service_name}-logs-attachment"
  roles      = [aws_iam_role.batch-example-execution-role.name, aws_iam_role.batch-example-job-role.name, aws_iam_role.aws_batch_service_role.name]
  policy_arn = aws_iam_policy.example_batch_policy_for_logs.arn
}
