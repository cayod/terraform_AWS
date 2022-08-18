terraform {
  required_version = "1.2.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.26.0"
    }

  }

  backend "s3" {}

}


provider "aws" {
  region = "sa-east-1"
  #Inserir o profile caso não queira usar o default
}


data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "remote-state" {

  bucket = "tfstate-${data.aws_caller_identity.current.account_id}"

  versioning {
    enabled = true
  }

  tags = {

    Description = "Stores terraform remote state files"

    ManagedBy = "Terraform"

    Owner = "Cayo Dias"

    CreatedAt = "2022-08-18"
  }

}

output "remote_state_bucket" {

  value = aws_s3_bucket.remote-state.bucket
}

output "remote_state_bucket_arn" {

  value = aws_s3_bucket.remote-state.arn
}