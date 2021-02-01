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
variable "serverport" {
    description = "ELB target server port"
    type        = string
}
variable "internal_option" {
    description = "ELB target server port"
    type        = bool
    default     = false
}
variable "subnets" {
    description = "ELB subnet setting"
    type        = list
}
variable "lb_type" {
    description = "ELB type"
    type        = string
}
variable "target_type" {
    description = "target type e.g instance, privateIP"
    type        = string
}
variable "hc_path" {
    description = "ELB health check Path e.g /"
    type        = string
    default = "/"
}

