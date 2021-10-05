#################################
##### VPC Module [21-07-21] #####
#################################
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

########################
##### [SG Module] ######
########################


#resource "aws_security_group_rule" "ingress" {
#  for_each = var.sg_rule
#  type              = "ingress"
#  from_port         = 0
#  to_port           = 65535
#  protocol          = "tcp"
#  cidr_blocks       = [aws_vpc.example.cidr_block]
#  ipv6_cidr_blocks  = [aws_vpc.example.ipv6_cidr_block]
#  security_group_id = module.network.aws_security_group.sg[var.security_group]
#}
resource "aws_security_group" "sg" {
  for_each = var.security_group
  name   = each.key
  description = "${each.key} description"
  vpc_id = var.vpc_id
  tags = {
    Name = each.key
  }
  ingress     = var.ingress
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  lifecycle {
    create_before_destroy = true
  }
}
