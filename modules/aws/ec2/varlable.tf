variable "ec2_instance" {
    type = map(object({
        image                        = string
        associate_public_ip_address  = bool
        public_subnet                = string
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