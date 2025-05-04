variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "vpc_name" {
  type        = string
  description = "VPC name"
}

variable "subnet_cidr" {
  type        = string
  description = "CIDR block for the private subnet"
}

variable "subnet_name" {
  type        = string
  description = "Subnet name"
}

variable "sg_name" {
  type        = string
  description = "Security group name"
}

variable "ingress_ports" {
  type    = list(number)
  description = "List of ingress ports"
}
