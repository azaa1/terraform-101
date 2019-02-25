provider "aws" {
  region = "eu-west-1"
}
terraform {
  backend "s3" {
    bucket = "mysample-terraform-bucket"
    key    = "dev/tfstate"
    region = "us-east-1"
  }
}
