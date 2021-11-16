resource "aws_s3_bucket" "coink_bucket_backend" {
  bucket = var.bucket_name
  acl = var.acl
}