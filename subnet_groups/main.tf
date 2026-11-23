resource "aws_db_subnet_group" "this" {
  name        = "${var.name}_Private_Subnet_Group"
  description = "Private Subnet for RDS"
  subnet_ids  = var.subnet_ids
}

