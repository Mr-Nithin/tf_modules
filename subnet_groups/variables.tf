variable "name" {
  description = "Enter the name of the subnet group"
  type        = string
  default     = "my_db_subnet_group"
}

variable "subnet_ids" {
  type = list(string)
}