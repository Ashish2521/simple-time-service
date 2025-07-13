variable "cidr_block" {
    type = string
    description = "CIDR block for the VPC"
    default = "10.0.0.0/16"
}

variable "vpc_name" {
    type = string
    description = "Name tag for the VPC"
    default = "ashish-personal-vpc"
}

variable "public_subnet_1a_cidr_block" {
    type = string
    description = "Public subnet 1a cidr block"
}
variable "public_subnet_1b_cidr_block" {
    type = string
    description = "Public subnet 1b cidr block"
}

variable "private_subnet_1a_cidr_block" {
    type = string
    description = "Private subnet 1a cidr block"
}
variable "private_subnet_1b_cidr_block" {
    type = string
    description = "Private subnet 1b cidr block"
}