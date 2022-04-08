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

variable "ecr_values" {
  type        = any
  default     = {}
  description = "AWS ECR configuration"
}

variable "ecs_values" {
  type        = any
  default     = {}
  description = "AWS ECS configuration"
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

variable "container" {
  type        = any
  default     = {}
  description = "Container configuration to deploy"
}

variable "registry_name" {
  type        = string
  default     = "example_ecs"
  description = "Registry name in ECR"
}


variable "iac" {}

variable "environment" {}
variable "account_id" {}
variable "vpc_id" {}

# AWS BATCH
variable "compute_environment_name" {}
variable "compute_environment_subnets" {}
variable "job_queue_name" {}
variable "job_definition_resource_vcpu" {}
variable "job_definition_resource_memory" {}
