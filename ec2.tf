# EC2 Module
module "ec2_instance" {
  source          = "./modules/aws/ec2"
  depends_on_list = [module.network]
  key_name        = var.key_name


  ec2_instance = {
    test-web-01 = {
      image         = "ami-0b276ad63ba2d6009"
      subnet_id     = "subnet-0d7f19f301691c98f"
      private_ip    = "10.0.10.11"
      instance_type = "t2.micro"

      associate_public_ip_address = "true"

      #        vpc_security_group_ids= [""]
    }

    #####
  }
}