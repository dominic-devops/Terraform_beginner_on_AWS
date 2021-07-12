# EC2 Module
module "aws_ec2" {
  source = "./modules/aws/ec2"


  ec2_instance = {
    test-web-01 = {
      image                       = "ami-0b276ad63ba2d6009"
      associate_public_ip_address = "true"
      public_subnet               = "subnet-0584670e27844fe65"
      private_ip                  = "10.0.10.5"
      instance_type               = "t2.micro"
      #        vpc_security_group_ids= [""]
    }
    test-web-02 = {
      image                       = "ami-0b276ad63ba2d6009"
      associate_public_ip_address = "true"
      public_subnet               = "subnet-0584670e27844fe65"
      private_ip                  = "10.0.10.6"
      instance_type               = "t2.micro"
      #        vpc_security_group_ids= [""]
    }
  }
}