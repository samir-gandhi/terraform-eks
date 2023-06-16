# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

terraform {

  cloud {
    //CHANGEME
    workspaces {
      name = "learn-terraform-eks-kubernetes"
    }
  }

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.21.1"
    }
  }
  required_version = "~> 1.3"
}

