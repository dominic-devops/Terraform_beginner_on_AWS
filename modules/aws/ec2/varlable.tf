# Set Ec2 Enviroment 
variable "name" {
    description = "This is Prefix Name"
    type        = string
}
variable "server-name" {
    description = "This is Prefix serverName"
    type        = string
}
variable "profile" {
    description = "Seperate DEV, STG, PRD"
    type        = string
}
variable "vpc_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "avail_zones" {
    description = "dokyo Region az"
    type        = list    
}

variable "sub_id" {
    description = "Subnet ID"
    type        = list
}

variable "public_ip" {
    description = "Set Public IP"
    type        = bool
    default     = false
}
/**
variable "vpc_security_group_ids" {
    description = "Set Security group on instance"
    type        = list
}
**/