# Set SecurityGroup Enviroment 
variable "name" {
    description = "This is Prefix Name"
    type        = string
}
variable "profile" {
    description = "Seperate DEV, STG, PRD"
    type        = string
}
variable "vpc_id" {
  type = string
}

variable "sg_cidr_blocks" {
    description = "This is Prefix Securitygroup Cidr"
    type        = list
}

variable "description" {
    description = "This is Prefix Securitygroup description"
    type = string
}
variable "sg_name" {
    type = string # security groups name input
}

variable "protocol" {
    type = string # protocol input e.g tcp,tls,udp
}

variable "from_port" {
    type = string # from port
}
variable "to_port" {
    type = string # to port 
}
variable "security_groups" {
    type = list
}
