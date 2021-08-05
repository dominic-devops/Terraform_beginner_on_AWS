# VPC Module
module "network" {
  source   = "./modules/aws/network"
  env_name = var.env_name
  vpc_name = var.vpc_name
  vpc_cidr = var.vpc_cidr
  vpc_id   = module.network.vpc_id

  avail_zones  = var.avail_zones
  pub_sub_cidr = var.public_subnet

  #######################
  security_group = {
    #######################
    test-web = {
      ingress = [
        {
          from_port   = 22
          to_port     = 22
          protocol    = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
        },
        {
          from_port   = 0
          to_port     = 100
          protocol    = "tcp"
          cidr_blocks = ["10.10.10.10/32"]
        },
        {
          from_port   = 2222
          to_port     = 2222
          protocol    = "tcp"
          cidr_blocks = ["100.100.100.0/24"]
        },
      ]
    }
    test-web2 = {
      ingress = [
        {
          from_port   = 22
          to_port     = 22
          protocol    = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
        },
        {
          from_port   = 0
          to_port     = 100
          protocol    = "tcp"
          cidr_blocks = ["10.10.10.10/32"]
        },
        {
          from_port   = 2222
          to_port     = 2222
          protocol    = "tcp"
          cidr_blocks = ["100.100.100.0/24"]
        },
      ]
    }
    #####  
  }
}
