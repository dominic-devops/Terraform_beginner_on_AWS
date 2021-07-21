output "ec2_instance" {
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