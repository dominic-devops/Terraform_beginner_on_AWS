# VPC Module
module "network" {
  source   = "./module/aws/network"
  vpc_name = var.vpc_name
  vpc_cidr = var.vpc_cidr
  vpc_id   = module.network.vpc_id

  avail_zones  = var.avail_zones
  pub_sub_cidr = var.public_subnet
  pri_sub_cidr = var.private_subnet

#Security Group
################################
 sg_rule = {
################################
  internal = {
    ingress = [ 
      {
      ranges = [var.vpc_cidr]
      protocol = "-1"
      ports    = "0"
      desc     = "Allow internal traffic"
      },     
    ]
  }
  terraform-ssh = {
    ingress = [ 
      {
      ranges = ["0.0.0.0/0", "10.0.0.0/16"]
      protocol = "tcp"
      ports    = "22"
      desc     = "Allow ALL ssh"
      },      
    ]
  }
#####
 }
}