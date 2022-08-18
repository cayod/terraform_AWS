resource "aws_s3_bucket" "this" {
  bucket = "${random_pet.bucket.id}-${var.environment}"

  tags = {
    Service = "Teste Terraform"

    ManagedBy = "Terraform"

    Environment = var.environment

    Owner = "Cayo Dias"
  }


}