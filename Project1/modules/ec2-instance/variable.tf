variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "backend_servers" {
  type = list(string)
}


variable "subnet_id" {
  description = "The ID of the subnet"
  type        = string
}

variable "sg_id" {
  description = "The ID of the security group"
  type        = string
}