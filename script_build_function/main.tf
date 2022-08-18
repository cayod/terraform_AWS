terraform {
  required_version = "1.2.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.26.0"
    }
    archive = {
      source  = "hashicorp/archive"
      version = "2.2.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.3.2"
    }
    template = {
      source  = "hashicorp/template"
      version = "2.2.0"
    }
  }
}

provider "aws" {
  region  = var.aws_region
}