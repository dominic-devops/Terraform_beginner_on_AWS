resource "aws_instance" "ec2" {
  for_each                    = var.ec2_instance
  tags = {
    Name = each.key
  }
  ami                         = each.value.image
  subnet_id                   = each.value.subnet_id
  instance_type               = each.value.instance_type
  associate_public_ip_address = each.value.associate_public_ip_address
  private_ip                  = each.value.private_ip
  key_name                    = var.key_name
  disable_api_termination     = false
  ebs_optimized = "false" ## 최적화 지원 인스턴스로 Confirm될 경우 변경하거나 섞어쓸꺼면 variable선언필요

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