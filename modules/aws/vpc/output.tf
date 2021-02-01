# VPC output
output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.myvpc.id
}

output "vpc_cidr_block" {
  description = "VPC CIDR block"
  value       = aws_vpc.myvpc.cidr_block
}