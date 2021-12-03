### VPC Module ###
resource "aws_vpc" "vpc" {
    cidr_block = var.vpc_cidr
    instance_tenancy = "default"
    enable_dns_hostnames = "true"
      tags = { 
    Name ="${var.vpc_name}-vpc"
  }
}

# Create Public_Subnet
resource "aws_subnet" "public_subnet" {
    count             = length(var.pub_sub_cidr)
    vpc_id            = var.vpc_id
    cidr_block        = var.pub_sub_cidr[count.index]
    availability_zone = var.avail_zones[count.index]

    tags = {
        Name = "${var.vpc_name}-public_subnet-${substr(var.avail_zones[count.index],-1,1)}-${count.index+1}"
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
    tags = {
        Name = "${var.vpc_name}-public_rt"
    }      
}
# route table association
resource "aws_route_table_association" "public_rt_asso" {
  count = length(var.pub_sub_cidr)

  subnet_id      = aws_subnet.public_subnet.*.id[count.index]
  route_table_id = aws_route_table.public_rt.id
}
####################################################

resource "aws_subnet" "private_subnet" {
    count             = length(var.pri_sub_cidr)
    vpc_id            = var.vpc_id
    cidr_block        = var.pri_sub_cidr[count.index]
    availability_zone = var.avail_zones[count.index]

    tags = {
        Name = "${var.vpc_name}-private_subnet-${substr(var.avail_zones[count.index],-1,1)}-${count.index+1}"
    }    
  }
#sg
resource "aws_security_group" "sg_allow" {
  for_each    = var.sg_rule
  vpc_id      = var.vpc_id
  name        = each.key
  description = each.key
  tags = {
    Name = each.key
  }

  dynamic "ingress" {
    for_each = [for rule in each.value.ingress : rule]
    iterator = rule
    content {
      cidr_blocks = rule.value.ranges
      protocol    = rule.value.protocol
      from_port   = rule.value.ports
      to_port     = rule.value.ports
      description = rule.value.desc
     }
  }
}