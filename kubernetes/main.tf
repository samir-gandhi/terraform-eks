provider "kubernetes" {
  host                   = var.cluster_endpoint
  cluster_ca_certificate = base64decode(var.cluster_ca_cert)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = ["eks", "get-token", "--cluster-name", var.cluster_name, "--region", var.cluster_region]
    command     = "aws"
  }
}

variable "cluster_endpoint" {
  description = "Endpoint for EKS control plane"
}

variable "cluster_ca_cert" {
  description = "CA certificate of EKS cluster"
}

variable "cluster_name" {
  description = "Name of EKS cluster"
}

variable "cluster_region" {
  description = "Region of EKS cluster"
}

data "kubernetes_all_namespaces" "allns" {}

output "namespaces" {
  value = data.kubernetes_all_namespaces.allns.namespaces
}

# resource "kubernetes_config_map" "aws-auth" {
#   data = {
#     "mapRoles" = ""
#   }

#   metadata {
#     name      = ""
#     namespace = ""
#   }
# }

# data "kubernetes_config_map" "aws_auth" {
#   metadata {
#     name      = "aws-auth"
#     namespace = "kube-system"
#   }
# }

# output "auth_config_map" {
#   value = data.kubernetes_config_map.aws_auth
# }

# data "aws_caller_identity" "current" {}

# output "account_id" {
#   value = data.aws_caller_identity.current.account_id
# }

# output "caller_arn" {
#   value = data.aws_caller_identity.current.arn
# }

# output "caller_user" {
#   value = data.aws_caller_identity.current.user_id
# }
