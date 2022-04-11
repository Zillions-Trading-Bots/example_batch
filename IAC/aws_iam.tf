resource "aws_iam_role" "batch-example-execution-role" {
  name = "batch-example-execution-role"
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

resource "aws_iam_policy" "example_batch_policy_for_logs" {
  name        = "example-batch-logs"
  description = "example batch logs"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents",
                "logs:DescribeLogStreams"
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
  name       = "example-batch-logs-attachment"
  roles      = [aws_iam_role.batch-example-execution-role.name]
  policy_arn = aws_iam_policy.example_batch_policy_for_logs.arn
}

resource "aws_iam_role" "batch-example-job-role" {
  name = "batch-example-job-role"
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


resource "aws_iam_role" "batch-example-service-role" {
  name = "batch-example-service-role"
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
resource "aws_iam_role_policy_attachment" "awsbatch_role_policy_attachment" {
  role       = aws_iam_role.batch-example-service-role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBatchServiceRole"
}
