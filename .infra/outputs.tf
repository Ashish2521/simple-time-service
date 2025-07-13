output "vpc_id" {
    value = module.vpc.vpc_id
}
output "public_subnet_1a_id" {
  value = module.public_subnet_1a.subnet_id
}

output "private_subnet_1a_id" {
  value = module.private_subnet_1a.subnet_id
}
