terraform {
  required_version = "1.2.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.26.0"
    }
  }
}


provider "aws" {
  region = "sa-east-1"
  #Inserir o profile caso não queira usar o default
}


resource "aws_s3_bucket" "test-bucket" {
  bucket = "my-tf-test-bucket-653132435154"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
    ManagedBy   = "Terraform"
    Owner       = "Cayo Dias"
    UpdatedAt   = "2022-08-17"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.test-bucket.id
  acl    = "private"
}