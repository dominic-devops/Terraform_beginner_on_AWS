# EC2 Module
module "ec2_instance" {
  source          = "./module/aws/ec2"
  depends_on_list = [module.network]
  key_name        = var.key_name

  ec2_instance = {
#    example_ec2 = {
#      image                       = "ami-0b276ad63ba2d6009" ## change
#      subnet_id                   = module.network.public_subnet[0] ## change 
#      private_ip                  = "10.0.10.11" ## change
#      instance_type               = "t2.micro" ## change
#      vpc_security_group_ids      = ["sg-059d51f6c7cab1231","sg-0eb5edf0ddf97523b"] ## change

#      root_block_device           = [{ volume_size = "100", volume_type = "gp2" }] ## change
#   }

    test-server = {
      image                       = "ami-0b276ad63ba2d6009"
      subnet_id                   = module.network.private_subnet[0]
      private_ip                  = "10.0.10.11"
      instance_type               = "t2.micro" 
      vpc_security_group_ids      = []

      root_block_device           = [{ volume_size = "50", volume_type = "gp2" }]
   }
#### END #####
  }
}