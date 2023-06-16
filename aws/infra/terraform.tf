terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.49.0"
    }
  }
  cloud {
    organization = "samir-playground"
    workspaces {
      name = "terraform-aws-infra"
    }
  }
}
