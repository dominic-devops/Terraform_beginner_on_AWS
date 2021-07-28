# VPC output
output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.vpc.id
}
output "vpc_cidr_block" {
  description = "VPC CIDR block"
  value       = aws_vpc.vpc.cidr_block
}
# subnets
output "public_subnet" {
  description = "Public Subnet ID list"
  value       = aws_subnet.public_subnet.*.id
}
# internet gateway
output "igw_id" {
  description = "Interget Gateway ID"
  value       = aws_internet_gateway.igw.id
}
# route tables
output "public_route_table_ids" {
  description = "Public Route Table ID list"
  value       = aws_route_table.public_rt.*.id
}
output "self_link" {
    value       = aws_subnet.public_subnet
}