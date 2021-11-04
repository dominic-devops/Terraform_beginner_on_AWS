### VPC ###
variable "vpc_name" {
    description = "Set VPC name "
    type        = string
}
variable "vpc_cidr" {
    description = "Set VPC CIDR "
    type        = string
}
variable "vpc_id" {
  type = string
}
### subnet ###
variable "avail_zones" {
    description = "Region az"
    type        = list    
}
variable "pub_sub_cidr" {
    description = "Set Public Subnet CIDR"
    type        = list
}
variable "sg_allow" {
    type = map(object({
      type              = string
      cidr              = list(string)
      protocol          = string
      rules = list(object({
          protocol  = string
          to_port   = list(string)
          from_port = list(string)
      }))
    }))
    default = {}
}