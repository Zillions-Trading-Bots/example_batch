variable "region" {}

variable "CVI_ID" {}
variable "sigla" {}
variable "equipes" {}
variable "projeto" {}
variable "iac" {}

variable "environment" {}
variable "account_id" {}
variable "vpc_id" {}

# AWS BATCH
variable "compute_environment_name" {}
variable "compute_environment_subnets_virginia" {}
variable "job_queue_name_python" {}
variable "job_queue_name_dotnet" {}
variable "job_definition_resource_vcpu" {}
variable "job_definition_resource_memory" {}
