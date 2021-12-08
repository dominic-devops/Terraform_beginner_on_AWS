variable "ec2_instance" {
    type = map(object({
      image                        = string
      subnet_id                    = string
      private_ip                   = string
      instance_type                = string
      vpc_security_group_ids       = list(string)
      root_block_device             = list(object({
        volume_size   = number
        volume_type   = string
      }))
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