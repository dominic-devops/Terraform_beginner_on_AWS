# VPC output
output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.myvpc.id
}

output "vpc_cidr_block" {
  description = "VPC CIDR block"
  value       = aws_vpc.myvpc.cidr_block
}

#output "sg_id" {
#  description = "output sg id"
#  value       = [aws_security_group.sg_template.id]
#}

# subnets
output "public_subnets_ids" {
  description = "Public Subnet ID list"
  value       = aws_subnet.public.*.id
}
#output "private_subnets_ids" {
#  description = "Private Subnet ID list"
#  value       = aws_subnet.private.*.id
#}

#output "database_subnets_ids" {
#  description = "Database Subnet ID list"
#  value       = aws_subnet.database.*.id
#}

# internet gateway
output "igw_id" {
  description = "Interget Gateway ID"
  value       = aws_internet_gateway.igw.id
}

# route tables
output "public_route_table_ids" {
  description = "Public Route Table ID list"
  value       = aws_route_table.public.*.id
}

#output "private_route_table_ids" {
#  description = "Private Route Table ID list"
#  value       =aws_route_table.private.*.id
#}

# NAT gateway
#output "nat_eip_ids" {
#  description = "NAT Gateway EIP id lsit"
#  value       = aws_eip.nat_eip.*.id
#}

#output "natgw_ids" {
#  description = "NAT Gateway ID list"
#  value       = aws_nat_gateway.natgw.*.id
#}