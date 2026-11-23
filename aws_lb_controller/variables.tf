variable "cluster_name" {
  description = "Enter the cluster name"
  type        = string
}

variable "chart_version" {
  description = "Enter the Chart version"
  type        = string
  default     = "3.6.3"
}

variable "vpc_id" {
  type = string
}

variable "region" {
  type = string
}