# EC2 Module
module "ec2_instance" {
  source          = "./modules/aws/ec2"
  depends_on_list = [module.network]
  key_name        = var.key_name

  ec2_instance = {
    public_ec2 = {
      image                       = "ami-0b276ad63ba2d6009" ## change
      subnet_id                   = module.network.public_subnet[0] ## change
      private_ip                  = "10.0.10.11" ## change
      instance_type               = "t2.micro" ## change
      vpc_security_group_ids      = ["sg-0047d8f96587b7f74"]

      root_block_device           = [{ volume_size = "100", volume_type = "gp2" }] ## change

   }
    private_ec2_1 = {
      image                       = "ami-0b276ad63ba2d6009" ## change
      subnet_id                   = module.network.private_subnet[0] ## change
      private_ip                  = "10.0.100.11" ## change
      instance_type               = "t2.micro"  ## change
      vpc_security_group_ids      = ["sg-0047d8f96587b7f74"]

      root_block_device           = [{ volume_size = "100", volume_type = "gp2" }] ## change
    }
    #####
  }
}