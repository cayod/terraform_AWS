resource "aws_s3_bucket" "this" {
  bucket = "${random_pet.bucket.id}-${var.environment}"

  tags = local.common_tags

}

resource "aws_s3_bucket_object" "this" {

  bucket = aws_s3_bucket.this.bucket

  key = "key"
  
}