
variable "openid_provider_arn" {
  description = "Enter the arn of the IRSA"
  type        = string

}

variable "cluster_name" {
  description = "Enter the name of the cluster"
  type        = string
}

variable "enable_cluster_autoscaler" {
  description = "Do you want to add cluster autoscaler ?"
  type        = bool
}

variable "cluster_autoscaler_helm_version" {
  description = "Enter the Helm chart version"
  type        = string
}

