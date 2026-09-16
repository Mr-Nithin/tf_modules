output "vpc_id" {
  description = "The vpc ID"
  value       = aws_vpc.this.id
}

output "Public_Subnet_ids" {
  description = "List of Public Subnets"
  value       = aws_subnet.public[*].id
}

output "Private_Subnet_ids" {
  description = "List of Private Subnets"
  value       = aws_subnet.private[*].id
}

output "ssh_security_group" {
  description = "SSH Security Group"
  value       = aws_security_group.ssh.id
}

output "web_security_group" {
  description = "Web Security Group"
  value       = aws_security_group.web.id
}


output "VPC_URL" {
  description = "VPC URL"
  value       = "https://${data.aws_region.this.region}.console.aws.amazon.com/vpcconsole/home?region=${data.aws_region.this.region}#VpcDetails:VpcId=${aws_vpc.this.id}"
}