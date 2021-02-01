# Set VPC Enviroment 
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
variable "avail_zones" {
    description = "dokyo Region az"
    type        = list    
}
variable "pub_sub_cidr" {
    description = "Set Public Subnet CIDR"
    type        = list
}
variable "pri_sub_cidr" {
    description = "Set Private Subnet CIDR"
    type        = list
}
variable "db_sub_cidr" {
    description = "Set Private Subnet CIDR"
    type        = list
}

