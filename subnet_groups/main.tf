resource "aws_db_subnet_group" "this" {
  name        = lower("${var.name}")
  description = "Private Subnet for RDS"
  subnet_ids  = var.subnet_ids
}

