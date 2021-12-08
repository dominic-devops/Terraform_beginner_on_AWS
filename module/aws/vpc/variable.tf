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
variable "pri_sub_cidr" {
    description = "Set private Subnet CIDR"
    type        = list
}
variable "sg_rule" {
  type = map(object({
    ingress = list(object({
      ranges = list(string)
      protocol = string
      ports    = number
      desc     = string
    }))
    egress = list(object({
      ranges = list(string)
      protocol = string
      ports    = number
      desc     = string
    }))
  }))
  default = {}
}
variable "depends_on_list" {
  default = []
}
