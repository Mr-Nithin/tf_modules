variable "openid_provider_arn" {
  description = "Enter the arn of the IRSA"
  type        = string
}

variable "cluster_name" {
  description = "Enter the name of the cluster"
  type        = string
  default     = "null"
}

variable "enable_pod_identity_agent" {
  description = "Do you want to enable pod identity agent ?"
  type        = bool
  default     = true
}

variable "enable_cluster_autoscaler" {
  description = "Do you want to add cluster autoscaler ?"
  type        = bool
  default     = false
}

variable "cluster_autoscaler_helm_version" {
  description = "Enter the Helm chart version"
  type        = string
  default     = "9.59.0"
}

variable "enable_csi_driver" {
  description = "Do you want to enable EBS CSI driver ?"
  type        = bool
  default     = false
}

