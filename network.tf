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
 ##############################
   test-web = {
     ingress = [
      {
        rules = [
          {
        protocol     = "tcp"
        cidr_blocks  = ["10.0.0.0/8"]
        to_port      = ["22"]
        from_port    = ["33"]
         }
        ]
      }
    ]
  }
####end####    
  }
}
