terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  cloud {
    organization = "samir-playground"
    workspaces {
      name = "terraform-eks"
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