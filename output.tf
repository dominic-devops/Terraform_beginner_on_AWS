output "subnet_info" {
  value = [
    for ins in module.network.self_link :
    format("%s,%s",
      ins.cidr_block,
      ins.availability_zone,
    )
  ]
}
output "ec2_info" {
  value = [
    for ins in module.ec2_instance.self_link :
    format("%s, %s, %s, %s",
      ins.id,
      ins.instance_type,
      ins.private_ip,
      ins.public_ip,
    )
  ] 
}