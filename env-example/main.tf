################################################
provider "aws" {
  region = "ap-northeast-1"
}
################################################
# VPC Module
module "vpc" {
  source  = "./../modules/aws/vpc"
  name    = "dominic"
  profile = "dev"

  vpc_cidr = "10.0.0.0/16"
}

#Sunbet Module
module "subnet" {
  source  = "./../modules/aws/subnet"
  name    = "dominic"
  profile = "dev"

  vpc_id       = module.vpc.vpc_id
  avail_zones  = ["ap-northeast-1a", "ap-northeast-1c"]
  pub_sub_cidr = ["10.0.10.0/24", "10.0.11.0/24"]
  pri_sub_cidr = ["10.0.20.0/24", "10.0.21.0/24"]
  db_sub_cidr  = ["10.0.30.0/24", "10.0.31.0/24"]
}

#Ec2 Module
module "bastion-instance" {
  source  = "./../modules/aws/ec2"
  name    = "dominic"
  profile = "dev"

  vpc_id = module.vpc.vpc_id

  instance_type = "t2.micro"
  avail_zones   = ["ap-northeast-1a", "ap-northeast-1c"]
  sub_id    = module.subnet.public_subnets_ids
  public_ip     = true
  server-name = "bastion"
}

module "web-instance" {
  source  = "./../modules/aws/ec2"
  name    = "dominic"
  profile = "dev"

  vpc_id = module.vpc.vpc_id

  instance_type = "t2.micro"
  avail_zones   = ["ap-northeast-1a", "ap-northeast-1c"]
  sub_id    = module.subnet.private_subnets_ids
  server-name = "web"
}

module "was-instance" {
  source  = "./../modules/aws/ec2"
  name    = "dominic"
  profile = "dev"

  vpc_id = module.vpc.vpc_id

  instance_type = "t2.micro"
  avail_zones   = ["ap-northeast-1a", "ap-northeast-1c"]
  sub_id    = module.subnet.private_subnets_ids
  server-name = "was"
}