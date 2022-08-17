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
  region = var.aws_region
  #Inserir o profile caso não queira usar o default
}

resource "aws_instance" "web" {
  ami           = var.instance_ami
  instance_type = var.instance_type

  tags = var.instance_tags
}