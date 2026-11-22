variable "name" {
  description = "Enter the name of the subnet group"
  type = string
  default = "My_DB_Subnet_Group"
}

variable "subnet_ids" {
  type = list(string)
}