resource "aws_iam_role" "devops-batch-example-execution-role" {
  name = "devops-batch-example-execution-role"
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
  role       = aws_iam_role.devops-batch-example-execution-role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_iam_role" "devops-batch-example-job-role" {
  name = "devops-batch-example-job-role"
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
  role       = aws_iam_role.devops-batch-example-job-role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}


resource "aws_iam_role" "devops-batch-example-service-role" {
  name = "devops-batch-example-service-role"
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
  role       = aws_iam_role.devops-batch-example-service-role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBatchServiceRole"
}
