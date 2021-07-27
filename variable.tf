# Set Enviroment 
variable "profile" {
  default = { ##메모##
    account    = "XXXXXXXXX"
    kname      = "AWS-테라폼"
    publishing = "XXX"
    team       = "Ops팀"
    admin      = "Dominic"
  }
}
variable "vpc_name" {
  description = "Set VPC NAME"
  default     = "terraform"
}
variable "env_name" {
  description = "Set ENV NAME"
  default     = "DEV"
}
variable "vpc_cidr" {
  description = "Set VPC CIDR"
  default     = "10.0.0.0/16"
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
  default = "home-test"
}