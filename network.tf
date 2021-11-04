# VPC Module
module "network" {
  source   = "./modules/aws/network"
  vpc_name = var.vpc_name
  vpc_cidr = var.vpc_cidr
  vpc_id   = module.network.vpc_id

  avail_zones  = var.avail_zones
  pub_sub_cidr = var.public_subnet

 ########Inbound rule##########
 sg_allow = {
 ############################
   test-web = {
         type        ="ingress"
         protocol    = "tcp"
         cidr        = ["0.0.0.0/0"]
         rules = [
           {
             protocol = "tcp"
             to_port = [ "22" ]
             from_port = [ "50" ]
           }
         ]
   }
 }
}
