# Set SecurityGroup Enviroment 
variable "name" {
    description = "This is Prefix Name"
    type        = string
}
variable "profile" {
    description = "Seperate DEV, STG, PRD"
    type        = string
}

variable "avail_zones" {
    description = "dokyo Region az"
    type        = list    
}
variable "db_name" {
    description = "dokyo Region az"
    type        = string   
}
variable "deletion_protect"{
    type        = bool
    default     = false
}
variable "cluster_identifier" {
    description = "cluster_identifier setting"
    type        = string   
}
variable "security_groups" {
    description = "security_groups setting"
    type        = list    
}
variable "engine_type" {
    description = "RDS engine_version"
    type        = string    
}
variable "engine_version" {
    description = "RDS engine_version"
    type        = string    
}
variable "db_port" {
    description = "RDS port"
    type        = string    
}

variable "password" {
    description = "RDS password setting !"
    type        = string    
}

variable "engine_mode" {
    description = "RDS mode setting"
    type        = string    
}

variable "subnets" {
    description = "RDS subnet setting"
    type        = list
}