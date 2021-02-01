
# Set VPC Enviroment 
variable "name" {
    description = "This is Prefix Name"
    type        = string
}
variable "profile" {
    description = "Seperate DEV, STG, PRD"
    type        = string
}

variable "vpc_cidr" {
    description = "Set VPC CIDR "
    type        = string
}