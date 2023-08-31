variable "name_prefix" {
  type = string
  default = "default-prefix"
}

variable "vpc_id" {
  type = string
}

# Routing table
variable "rtb_id" {
  type = string
}

# private network
variable "private_network_cidr" {
  type = string
}

variable "image" {
  type = string
}

variable "keypair_id" {
  type = string
}

variable "subnet_id" {
  type = string
}
