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
#sg

resource "aws_security_group" "allow" {
  for_each = var.sg_allow
  vpc_id = var.vpc_id
}

resource "aws_security_group_rule" "allow_rules" {
  for_each = var.sg_allow
  vpc_id = var.vpc_id
  name   = each.key

  description = "${each.key} description"
  type  = each.value.type
  cidr = each.value.cidr
  protocol = each.value.protocol
  
  dynamic "allow"{
    for_each = [for rule in each.value.rules : rule if each.value.type == "allow"]
    iterator = rule
    content {
      protocol  = rule.value.protocol
      to_port   = rule.value.to_port
      from_port = rule.value.from_port
    }
  }
  tags = {
    Name = each.key
  }
  lifecycle {
    create_before_destroy = true
  }
}