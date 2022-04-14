variable "app_name" {
  type        = string
  default     = "example"
  description = "App Name"
}

variable "service_name" {
  type        = string
  default     = "example_batch"
  description = "Service Name"
}

variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "AWS region"
}

variable "tags" {
  type = map(string)
  default = {

  }
}

variable "job_definition_image_full_url" {
  type    = string
  default = "amazonlinux"
  #default     = "016431746308.dkr.ecr.us-east-1.amazonaws.com/example_python_flask:v1.0.7"
  description = "Job Definition Image Full URL"
}

