


resource "aws_instance" "ec2" {
  for_each                    = var.ec2_instance
  tags = {
    Name = each.key
  }
  ami                         = each.value.image
  subnet_id                   = each.value.subnet_id
  instance_type               = each.value.instance_type
  private_ip                  = each.value.private_ip
  key_name                    = var.key_name
  disable_api_termination     = false
#  associate_public_ip_address = var.public_ip ## default false
  vpc_security_group_ids       = each.value.vpc_security_group_ids

  #ebs_optimized = "true" ## Instance 타입별 상이

  dynamic "root_block_device" {
    for_each = each.value.root_block_device == null ? [] : each.value.root_block_device
    content {
      delete_on_termination = "true"
      volume_size           = lookup(root_block_device.value, "volume_size", null)
      volume_type           = lookup(root_block_device.value, "volume_type", null)
      tags                  = {
        Name = "${each.key}-root-disk"
        }
    }
  }
}

resource "aws_eip" "this" {
  vpc = true
#  name = "test"
}