variable "aws_region" {
    description = "The AWS region where resources will be deployed (us-east-1, us-west-1)"
    type        = string
    default     = "us-east-1"
}

variable "environment" {
    description = "The environment for deployment (devel, stage, prod)"
    type        = string
    default     = "devel"
}