variable "creation_token" {
  description = "Enter the name of the Creation Token"
  type        = string
}

variable "performance_mode" {
  description = "Enter the type of performance mode"
  type        = string
  default     = "generalPurpose"
}

variable "throughput_mode" {
  description = "Enter the type of Throughput mode"
  type        = string
  default     = "bursting"
}

variable "transition_to_ia" {
  description = "Enter the Transition to IA"
  type        = string
  default     = "AFTER_30_DAYS"
}

