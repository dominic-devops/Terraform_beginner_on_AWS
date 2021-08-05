# EC2 Module
module "ec2_instance" {
  source          = "./modules/aws/ec2"
  depends_on_list = [module.network]
  key_name        = var.key_name

  ec2_instance = {
    #    test-web-01 = {
    #      image                       = "ami-0b276ad63ba2d6009"
    #      subnet_id                   = module.network.public_subnet[0]
    #      private_ip                  = "10.0.10.11"
    #      instance_type               = "t2.micro"
    #      root_block_device           = [{ volume_size = "20", volume_type = "gp2" }]
    #
    #   #   vpc_security_group_ids      = module.network.aws_security_group.sg["test-web"]
    #      
    #    }
    k8m = {
      image                       = "ami-081a55f4c490c7b66"
      subnet_id                   = module.network.public_subnet[1]
      private_ip                  = "10.0.11.11"
      instance_type               = "t2.micro"
      associate_public_ip_address = "true"
      root_block_device           = [{ volume_size = "100", volume_type = "gp2" }]

      #     vpc_security_group_ids= [""]
    }
    k8s = {
      image                       = "ami-081a55f4c490c7b66"
      subnet_id                   = module.network.public_subnet[1]
      private_ip                  = "10.0.11.12"
      instance_type               = "t2.micro"
      associate_public_ip_address = "true"
      root_block_device           = [{ volume_size = "100", volume_type = "gp2" }]

      #     vpc_security_group_ids= [""]
    }
    #####
  }
}
