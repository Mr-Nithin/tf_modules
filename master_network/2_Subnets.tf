resource "aws_subnet" "public" {
  count                   = length(var.public_subnets)
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.public_subnets[count.index]
  map_public_ip_on_launch = true
  availability_zone       = var.az[count.index % length(var.az)]
  tags = {
    Name                     = "Public_Subnet_${count.index + 1}"
    "kubernetes.io/role/elb" = 1

  }
}

resource "aws_subnet" "private" {
  count                   = length(var.private_subnets)
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.private_subnets[count.index]
  map_public_ip_on_launch = false
  availability_zone       = var.az[count.index % length(var.az)]
  tags = {
    Name                              = "Private_Subnet_${count.index + 1}"
    "kubernetes.io/role/internal-elb" = 1
  }
}




