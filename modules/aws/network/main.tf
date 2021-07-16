#################################
##### VPC Module [21-07-08] #####
#################################
resource "aws_vpc" "vpc" {
    cidr_block = var.vpc_cidr
    instance_tenancy = "default"
      tags = {
    Name ="${var.vpc_name}-${var.env_name}-vpc"
  }
}

# Create Public_Subnet
resource "aws_subnet" "public_subnet" {
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
resource "aws_route_table" "public_rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

# route table association
resource "aws_route_table_association" "public_rt_asso" {
  count = length(var.pub_sub_cidr)

  subnet_id      = aws_subnet.public_subnet.*.id[count.index]
  route_table_id = aws_route_table.public_rt.id
}