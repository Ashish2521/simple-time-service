variable "vpc_id" {
  type = string
}

variable "cidr_block" {
  type = string
}

variable "availability_zone" {
  type = string
}

variable "map_public_ip" {
  type    = bool
  default = false
}

variable "name" {
  type = string
}
