terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~> 6.17.0"
      }
    }
}

variable "environment" {
    description = "Deployment environment name"
    default = "prod"
    type = string
}

variable "project_name" {
  description = "Project name"
  default = "opensplit"
  type = string
}