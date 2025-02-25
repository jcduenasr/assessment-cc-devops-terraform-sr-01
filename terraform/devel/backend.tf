terraform {
  backend "s3" {
    bucket = "terraform-states-jcduenasr"
    key    = "devel/terraform.tfstate"
    region = "us-east-1"

    encrypt = true
  }
}

provider "aws" {
    region = var.aws_region
}