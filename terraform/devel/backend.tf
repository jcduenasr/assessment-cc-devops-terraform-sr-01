terraform {
  backend "s3" {
    bucket = "terraform-states-jcduenasr"
    key    = "devel/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-state-project-jcduenasr-locking"
    encrypt = true
  }
}

provider "aws" {
    region = var.aws_region
}