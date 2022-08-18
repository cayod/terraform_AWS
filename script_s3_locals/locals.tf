locals {

    common_tags = {
    Service = "Teste Terraform"

    ManagedBy = "Terraform"

    Environment = var.environment

    Owner = "Cayo Dias"
  }
}