# VPC Module
module "network" {
  source   = "./modules/aws/network"
  env_name = var.env_name
  vpc_name = var.vpc_name
  vpc_cidr = var.vpc_cidr
  vpc_id   = module.network.vpc_id

  avail_zones  = var.avail_zones
  pub_sub_cidr = var.public_subnet


##### allow rule #####
  security_group = {
    ingress = { 
        cidr_block = ["0.0.0.0/0"],
        from_port = "80",
        to_port = "80",
        protocol = "tcp"
        }
  #  }
  }
}
