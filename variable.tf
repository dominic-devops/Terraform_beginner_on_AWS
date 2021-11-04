# Set Enviroment
variable "profile" {
  default = { ##메모##
    account    = "154536042159" ##change
    kname      = "AWS-테라폼테스트" ##change
    publishing = "XXX" ##change
    team       = "인프라서비스팀" ##change
    admin      = "Dominic" ## change
    env        = "DEV"  ## change
  }
}
variable "vpc_name" {
  description = "Set VPC NAME"
  default     = "terraform" ##change
}
variable "vpc_cidr" {
  description = "Set VPC CIDR"
  default     = "10.0.0.0/16" ##change
}
variable "avail_zones" {
  type    = list(any)
  default = ["ap-northeast-1a", "ap-northeast-1c", "ap-northeast-1a"]
}
variable "public_subnet" {
  type    = list(any)
  default = ["10.0.10.0/24", "10.0.11.0/24", "10.0.12.0/24"]
}

variable "key_name" {
  type    = string
  default = "infra-test"
}
