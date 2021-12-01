# EC2 Module
module "ec2_instance" {
  source          = "./modules/aws/ec2"
  depends_on_list = [module.network]
  key_name        = var.key_name

  ec2_instance = {
    public_ec2_1 = {
      image                       = "ami-0b276ad63ba2d6009"
      subnet_id                   = module.network.public_subnet[0]
      private_ip                  = "10.0.10.11"
      instance_type               = "t2.micro"
    
      root_block_device           = [{ volume_size = "100", volume_type = "gp2" }]

      #     vpc_security_group_ids= [""]
    }
    private_ec2_1 = {
      image                       = "ami-0b276ad63ba2d6009"
      subnet_id                   = module.network.private_subnet[0]
      private_ip                  = "10.0.20.11"
      instance_type               = "t2.micro"
      root_block_device           = [{ volume_size = "100", volume_type = "gp2" }]

      #     vpc_security_group_ids= [""]
    }
    #####
  }
}