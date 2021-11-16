terraform {
  backend "s3" {
    bucket = var.bucket_name
    key = var.environment
    region = "us-east-2"
  }
}