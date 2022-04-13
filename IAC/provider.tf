terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.9.0"
    }
  }
  required_version = ">= 1.1.0"

  cloud {
    organization = "afinoti"

    workspaces {
      name = "example_batch"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}

