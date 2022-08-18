resource "aws_s3_bucket" "this" {
  bucket = "${random_pet.bucket.id}-${var.environment}"

  tags = local.common_tags

}

resource "aws_s3_bucket_object" "this" {

  bucket = aws_s3_bucket.this.bucket

  key = "config/${local.ips_file_path}"

  source = local.ips_file_path

  etag = filemd5(local.ips_file_path)

  tags = local.common_tags

  content_type = "application/json"

}


resource "aws_s3_bucket_object" "random" {

  bucket = aws_s3_bucket.this.bucket

  key = "config/${random_pet.bucket.id}.json"

  source = local.ips_file_path

  etag = filemd5(local.ips_file_path)

  tags = local.common_tags

}