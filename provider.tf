terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.9.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.0.1"
    }
  }
  required_version = ">= 1.1.0"

  cloud {
    organization = "afinoti"

    workspaces {
      name = var.workspaces_name
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}

