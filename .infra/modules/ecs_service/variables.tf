variable "name" {
  type = string
}

variable "image" {
  type = string
}

variable "container_port" {
  type = number
}

variable "cluster_id" {
  type = string
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "security_group_id" {
  type = string
}
variable "target_group_arn" {
  type = string
}
