# VPC Module
module "aws_network" {
  source   = "./modules/aws/network"
  env_name = var.env_name
  vpc_name = var.vpc_name
  vpc_cidr = var.vpc_cidr
  vpc_id   = module.aws_network.vpc_id


  avail_zones  = var.avail_zones
  pub_sub_cidr = var.public_subnet

  ### Security Group ###



}
