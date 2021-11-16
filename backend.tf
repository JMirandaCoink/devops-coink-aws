terraform {
  backend "s3" {
    bucket = "coink-bkt-tfstate"
    key = "dev"
    region = "us-east-2"
  }
}