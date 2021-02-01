#################################
# Create Subnet
#################################
# Ap-northeast-1  Public Subnet #1 DMZ
resource "aws_subnet" "public" {
    count             = length(var.pub_sub_cidr)
    vpc_id            = var.vpc_id
    cidr_block        = var.pub_sub_cidr[count.index]
    availability_zone = var.avail_zones[count.index]

    tags = {
        Name = "${var.name}-${var.profile}-public-${substr(var.avail_zones[count.index],-1,1)}-${count.index+1}"
    }
}
# Ap-northeast-1  Private Subnet #1 web,was
resource "aws_subnet" "private" {
    count             = length(var.pri_sub_cidr)
    vpc_id            = var.vpc_id
    cidr_block        = var.pri_sub_cidr[count.index]
    availability_zone = var.avail_zones[count.index]
    
    tags = {
        Name = "${var.name}-${var.profile}-private-${substr(var.avail_zones[count.index],-1,1)}-${count.index+1}"
    }
}
# Ap-northeast-1a  Private Subnet #2 database
resource "aws_subnet" "database" {
    count             = length(var.db_sub_cidr)
    vpc_id            = var.vpc_id
    cidr_block        = var.db_sub_cidr[count.index]
    availability_zone = var.avail_zones[count.index]
    
    tags = {
        Name = "${var.name}-${var.profile}-db-${substr(var.avail_zones[count.index],-1,1)}-${count.index+1}"
    }
}

#################################
# Create InternetGateway
#################################
resource "aws_internet_gateway" "igw" {
    vpc_id = var.vpc_id

    tags = {
        Name = "${var.profile}-igw"
  }
}

#################################
# Create ElasticIPs for Natgateway
#################################
resource "aws_eip" "nat_eip" {
  count = length(var.avail_zones)

  vpc = true
}

#################################
# Create NatGateway
#################################
resource "aws_nat_gateway" "natgw" {
  count = length(var.avail_zones)

  allocation_id = aws_eip.nat_eip.*.id[count.index]
  subnet_id     = aws_subnet.public.*.id[count.index]
  
  tags = {
     Name = "${var.profile}-nat-${substr(var.avail_zones[count.index],-1,1)}-${count.index+1}"
    }
}

#################################
# public route table
#################################
resource "aws_route_table" "public" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
     Name = "${var.name}-${var.profile}-public-RT"
    }
}
#################################
# private route table
#################################
resource "aws_route_table" "private" {
  count = length(var.avail_zones)

  vpc_id = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.natgw.*.id[count.index]
  }

    tags = {
     Name = "${var.name}-${var.profile}-private-RT"
    }   
}

#################################
# route table association
#################################
resource "aws_route_table_association" "public" {
  count = length(var.pub_sub_cidr)

  subnet_id      = aws_subnet.public.*.id[count.index]
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  count = length(var.pri_sub_cidr)

  subnet_id      = aws_subnet.private.*.id[count.index]
  route_table_id = aws_route_table.private.*.id[count.index]
}

resource "aws_route_table_association" "database" {
  count = length(var.db_sub_cidr)

  subnet_id      = aws_subnet.database.*.id[count.index]
  route_table_id = aws_route_table.private.*.id[count.index]
}
