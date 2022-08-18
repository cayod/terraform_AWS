terraform {
  required_version = "1.2.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.26.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.3.2"
    }
  }

}


provider "aws" {
  region = var.aws_region
  #Inserir o profile caso não queira usar o default
}

