#################################
# Create VPC (CIDR 10.10.0.0/16) 
#################################
resource "aws_vpc" "myvpc" {
    cidr_block = var.vpc_cidr
    
    tags = {
        Name = "${var.name}-${var.profile}-vpc"
        }
}