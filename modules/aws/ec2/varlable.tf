variable "ec2_instance" {
    type = map(object({
      image                        = string
      associate_public_ip_address  = bool
      subnet_id                 = string
      private_ip                   = string
      instance_type                = string
    }))
    default = {}
}

variable "key_name" {
  description = "The key name to use for the instance"
  type        = string
  default     = ""
}
variable "depends_on_list" {
  default = []
}