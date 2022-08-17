terraform {
  required_version = "1.2.7"

  required_providers {
    aws = {
        source = "hashcorp/aws"
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
    Managedby = "Terraform"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.test-bucket.id
  acl    = "private"
}