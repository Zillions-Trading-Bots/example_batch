variable "app_name" {
  type        = string
  default     = "example_batch"
  description = "App Name"
}

variable "default_tags" {
  type = map(string)
  default = {
    "Name" = "example_batch"
  }
}

variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "AWS region"
}

variable "lb_values" {
  type        = any
  default     = {}
  description = "AWS Load Balancer configuration"
}

variable "vpc" {
  type        = any
  default     = {}
  description = "AWS VPC configuration"
}

# AWS BATCH
variable "compute_environment_name" {
  type        = string
  default     = "example_batch"
  description = "Compute Environment Name"
}



variable "job_definition_image_full_url" {
  type        = string
  default     = "016431746308.dkr.ecr.us-east-1.amazonaws.com/example_python_flask:v1.0.3"
  description = "Job Definition Image Full URL"
}


variable "job_queue_name" {
  type        = string
  default     = "example_batch_queue"
  description = "Job Queue Name"
}

variable "job_definition_resource_vcpu" {
  type        = number
  default     = 1
  description = "Job Definition Resource vCPU"
}

variable "job_definition_resource_memory" {
  type        = number
  default     = 2048
  description = "Job Definition Resource Memory"
}

variable "container" {
  type        = any
  default     = {}
  description = "Container configuration to deploy"
}


