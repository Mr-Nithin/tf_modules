variable "cidr_block" {
  description = "Enter the VPC CIDR Block"
  type        = string

  validation {
    condition     = can(cidrhost(var.cidr_block, 0))
    error_message = "Must be a valid IPv4 or IPv6 CIDR block (e.g., 10.0.0.0/16)."
  }
}

variable "vpc_name" {
  description = "Enter the VPC name"
  type        = string
}

variable "az" {
  description = "Enter the list of AZ"
  type        = list(string)
}

variable "public_subnets" {
  description = "Enter the list CIDR of Public Subnets"
  type        = list(string)
}

variable "private_subnets" {
  description = "Enter the list CIDR of Private Subnets"
  type        = list(string)
}


variable "max_aggregation_interval" {
  description = "Max interval of timing during which flow of packets captured. Allowed values 60 or 600seconds, 600 is Default"
  type        = number
  default     = 600
}

variable "flow_logs_retention_days" {
  description = "Enter the number of days to retain vpc flow logs"
  type        = number
}

variable "serivces" {
  description = "List of Gateway Services"
  type        = list(string)
  default     = ["dynamodb", "s3"]
}