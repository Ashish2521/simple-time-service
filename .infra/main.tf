provider "aws" {
    region = "us-east-1"
}

module "vpc" {
    source = "./modules/vpc"
    cidr_block = var.cidr_block
    name = var.vpc_name
}

module "public_subnet_1a" {
    source = "./modules/subnet"
    vpc_id = module.vpc.vpc_id
    cidr_block = var.public_subnet_1a_cidr_block
    availability_zone = "us-east-1a"
    map_public_ip     = true
    name              = "public-subnet-1a"
}
module "public_subnet_1b" {
    source = "./modules/subnet"
    vpc_id = module.vpc.vpc_id
    cidr_block = var.public_subnet_1b_cidr_block
    availability_zone = "us-east-1b"
    map_public_ip     = true
    name              = "public-subnet-1b"
}

module "private_subnet_1a" {
  source = "./modules/subnet"
  vpc_id = module.vpc.vpc_id
  cidr_block = var.private_subnet_1a_cidr_block
  availability_zone = "us-east-1a"
  map_public_ip = false
  name = "private-subnet-1a"
}

module "private_subnet_1b" {
  source = "./modules/subnet"
  vpc_id = module.vpc.vpc_id
  cidr_block = var.private_subnet_1b_cidr_block
  availability_zone = "us-east-1b"
  map_public_ip = false
  name = "private-subnet-1b"
}

module "igw" {
    source = "./modules/internet_gateway"
    vpc_id = module.vpc.vpc_id
    name = "ashish-psersonal-vpc-igw"
}

module "public_route_table" {
  source = "./modules/public_route_table"
  vpc_id = module.vpc.vpc_id
  igw_id = module.igw.igw_id
  public_subnet_a  = module.public_subnet_1a.subnet_id
  public_subnet_b  = module.public_subnet_1b.subnet_id
  name = "ashish-personal-vpc-route-table"
}

module "nat_gateway" {
  source           = "./modules/nat_gateway"
  public_subnet_id = module.public_subnet_1a.subnet_id
  name             = "ashish-vpc"
  igw_id           = module.igw.igw_id
}

module "private_route_table" {
  source            = "./modules/private_route_table"
  vpc_id            = module.vpc.vpc_id
  nat_gateway_id    = module.nat_gateway.nat_gateway_id
  private_subnet_a  = module.private_subnet_1a.subnet_id
  private_subnet_b  = module.private_subnet_1b.subnet_id
  name              = "ashish-vpc"
}

module "ecs_cluster" {
  source        = "./modules/ecs_cluster"
  cluster_name  = "ashish-ecs-cluster"
}

module "ecs_service" {
  source            = "./modules/ecs_service"
  name              = "simpletimeservice"
  image             = "ashish2521/simpletimeservice:v1"
  container_port    = 8000
  cluster_id        = module.ecs_cluster.ecs_cluster_id
  private_subnet_ids = [
    module.private_subnet_1a.subnet_id,
    module.private_subnet_1b.subnet_id
  ]
  security_group_id = aws_security_group.ecs_service_sg.id
}




