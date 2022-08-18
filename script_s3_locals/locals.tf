locals {

  ips_file_path = "ips.json"

  common_tags = {
    Service = "Teste Terraform"

    ManagedBy = "Terraform"

    Environment = var.environment

    Owner = "Cayo Dias"
  }
}