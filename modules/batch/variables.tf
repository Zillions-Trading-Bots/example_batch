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

variable "vpc" {
  type        = any
  default     = {}
  description = "AWS VPC configuration"
}

variable "job_definition_image_full_url" {
  type    = string
  default = "amazonlinux"
  #default     = "016431746308.dkr.ecr.us-east-1.amazonaws.com/example_python_flask:v1.0.7"
  description = "Job Definition Image Full URL"
}


variable "max_vcpus" {
  type        = number
  default     = 20
  description = "Max VCPUS"
}


#https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-cpu-memory-error.html
variable "job_definition_resource_vcpu" {
  type        = number
  default     = 0.25
  description = "Job Definition Resource vCPU"
}

variable "job_definition_resource_memory" {
  type        = number
  default     = 512
  description = "Job Definition Resource Memory"
}

variable "container" {
  type        = any
  default     = {}
  description = "Container configuration to deploy"
}


