resource "aws_vpc_endpoint" "this" {
  count             = length(var.serivces)
  vpc_id            = aws_vpc.this.id
  service_name      = "com.amazonaws.${data.aws_region.this.region}.${var.serivces[count.index]}"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = [aws_route_table.public.id, aws_route_table.private.id]
  tags = {
    Name = "${var.serivces[count.index]}-${aws_vpc.this.id}"
  }
}