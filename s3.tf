resource "aws_s3_bucket" "terra-backend" {
  bucket = "terra_backend"
  acl = var.acl

  tags = {
    name = var.bucket_name
  }
}