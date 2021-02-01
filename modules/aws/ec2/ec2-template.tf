data "aws_ami" "amazon_linux2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }
    owners = ["amazon"]
}

resource "aws_instance" "ec2-template" {
  count             = length(var.sub_id) 
  ami               = data.aws_ami.amazon_linux2.id
  instance_type     = var.instance_type
  availability_zone = var.avail_zones[count.index]
  subnet_id         = var.sub_id[count.index]
  key_name          = "${var.name}-key"
  associate_public_ip_address = var.public_ip
 # vpc_security_group_ids = var.vpc_security_group_ids
    
  root_block_device {
        volume_size = 8
        volume_type = "gp2"
        delete_on_termination = true
  }

  tags = {
     Name = "${var.name}-${var.profile}-${var.server-name}-${substr(var.avail_zones[count.index],-1,1)}"
  }
}