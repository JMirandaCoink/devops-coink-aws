resource "aws_s3_bucket" "coink-bucket" {
  bucket = var.bucket_name
  acl = var.acl
}