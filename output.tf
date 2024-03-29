output "public_subnet_info" {
  value = [
    for ins in module.network.public_link :
    format("%s, %s",
      ins.cidr_block,
      ins.availability_zone,
    )
  ]
}
output "private_subnet_info" {
  value = [
    for ins in module.network.private_link :
    format("%s, %s",
      ins.cidr_block,
      ins.availability_zone,
    )
  ]
}
output "ec2_info" {
  value = [
    for ins in module.ec2_instance.ec2_link :
    format("%s, %s, %s, %s",
      ins.instance_type,
      ins.private_ip,
      ins.public_ip,
      ins.id,
    )
  ]
}
output "sg_info" {
  value = [
    for ins in module.network.sg_link :
    format("%s : %s",
      ins.name,
      ins.id,
    )
  ]
}