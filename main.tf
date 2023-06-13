terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}

data "aws_vpcs" "foo" {}

output "vpcs" {
  value = data.aws_vpcs.foo.ids
}