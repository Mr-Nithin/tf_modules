variable "cluster_name" {
  description = "Enter the Cluster Name"
  type        = string
}

variable "eks_version" {
  description = "Enter the EKS version"
  type        = string
}

variable "deletion_protection" {
  description = "Do you want to protect from deltetion"
  type        = bool
}

variable "subnet_ids" {
  description = "Enter the list of Subnets"
  type        = list(string)
}

variable "node_groups" {
  description = "EKS node goups"
  type        = map(any)
}

variable "enable_irsa" {
  # Used to access AWS API - IRSA (IAM Roles for Service Accounts)
  description = "Do you want to enable OIDC to the AWS"
  type        = bool

}