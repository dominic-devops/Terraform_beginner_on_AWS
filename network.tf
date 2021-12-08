# VPC Module
module "network" {
  source   = "./module/aws/vpc"
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
      desc     = "ingressAllow internal traffic"
      },     
    ]
    egress = [   
    ]  
  }
  terraform-ssh = {
    ingress = [ 
      {
      ranges = ["0.0.0.0/0"]
      protocol = "tcp"
      ports    = "22"
      desc     = "Allow ALL ssh"
      },      
    ]
    egress = [ 
    ]
  }
  outbound = {
    ingress = [       
    ]
    egress = [ 
      {
      ranges = ["0.0.0.0/0"]
      protocol = "-1"
      ports    = "0"
      desc     = "outbound ALL traffic"
      }, 
    ]
  }
#####
 }
}