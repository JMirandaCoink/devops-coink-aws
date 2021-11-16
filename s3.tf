resource "aws_s3_bucket" "terra-backend" {
  bucket = "${var.project_name}-bucket"
  acl = var.acl

  tags = {
    name = var.bucket_name
  }
}