#################################
##### VPC Module [21-07-21] #####
#################################
resource "aws_vpc" "vpc" {
    cidr_block = var.vpc_cidr
    instance_tenancy = "default"
      tags = {
    Name ="-${var.env_name}-${var.vpc_name}-vpc"
  }
}

# Create Public_Subnet
resource "aws_subnet" "public_subnet" {
    count             = length(var.pub_sub_cidr)
    vpc_id            = var.vpc_id
    cidr_block        = var.pub_sub_cidr[count.index]
    availability_zone = var.avail_zones[count.index]

    tags = {
        Name = "${var.vpc_name}-sub-${substr(var.avail_zones[count.index],-1,1)}-${count.index+1}"
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
#################################
##### SG Module [21-07-21] ######
#################################
resource "aws_security_group" "sg" {
  for_each = var.security_group
  name   = each.key
  description = "${each.key} description"

  vpc_id = var.vpc_id
  tags = {
    Name = each.key
  }
  
  dynamic "ingress"{
  for_each = each.value.ingress
  iterator = in
  content {
    description = "${in.key} description"
    from_port   = in.value["from_port"]
    to_port     = in.value["to_port"]
    protocol    = in.value["protocol"]
    cidr_blocks = in.value["cidr_blocks"]
    }
  }
  dynamic "egress"{
  for_each = each.value.egress
  iterator = out
  content {
    description = "${out.key} description"
    from_port   = out.value["from_port"]
    to_port     = out.value["to_port"]
    protocol    = out.value["protocol"]
    cidr_blocks = out.value["cidr_blocks"]
    }
  }
}