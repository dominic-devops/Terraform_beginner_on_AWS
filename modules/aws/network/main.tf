#################################
##### VPC Module [21-07-08] #####
#################################
resource "aws_vpc" "myvpc" {
    cidr_block = var.vpc_cidr
    instance_tenancy = "default"
      tags = {
    Name ="${var.vpc_name}-${var.env_name}-vpc"
  }
}
# Create Public_Subnet
resource "aws_subnet" "public" {
    count             = length(var.pub_sub_cidr)
    vpc_id            = var.vpc_id
    cidr_block        = var.pub_sub_cidr[count.index]
    availability_zone = var.avail_zones[count.index]

    tags = {
        Name = "${var.vpc_name}-${substr(var.avail_zones[count.index],-1,1)}-${count.index+1}"
    }    
  }
# Create InternetGateway
resource "aws_internet_gateway" "igw" {
    vpc_id = var.vpc_id
}  
# public route table
resource "aws_route_table" "public" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

# route table association
resource "aws_route_table_association" "public" {
  count = length(var.pub_sub_cidr)

  subnet_id      = aws_subnet.public.*.id[count.index]
  route_table_id = aws_route_table.public.id
}
# Create Private_Subnet
#resource "aws_subnet" "private" {
#    count             = length(var.pri_sub_cidr)
#    vpc_id            = var.vpc_id
#    cidr_block        = var.pri_sub_cidr[count.index]
#    availability_zone = var.avail_zones[count.index]
#}


# Create ElasticIPs for Natgateway
#resource "aws_eip" "nat_eip" {
#  count = length(var.avail_zones)
#
#  vpc = true
#}

# Create NatGateway
#resource "aws_nat_gateway" "natgw" {
#  count = length(var.avail_zones)
#
#  allocation_id = aws_eip.nat_eip.*.id[count.index]
#  subnet_id     = aws_subnet.public.*.id[count.index]
#  
#}


# private route table
#resource "aws_route_table" "private" {
#  count = length(var.avail_zones)
#
#  vpc_id = var.vpc_id
#
#  route {
#    cidr_block     = "0.0.0.0/0"
#    nat_gateway_id = aws_nat_gateway.natgw.*.id[count.index]
#  }
#}

# route table association
#resource "aws_route_table_association" "private" {
#  count = length(var.pri_sub_cidr)
#
#  subnet_id      = aws_subnet.private.*.id[count.index]
#  route_table_id = aws_route_table.private.*.id[count.index]
#}