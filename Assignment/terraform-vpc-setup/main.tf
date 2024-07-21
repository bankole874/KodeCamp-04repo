module "vpc" {
  source = "./modules/vpc"
}

module "subnets" {
  source = "./modules/subnets"
  vpc_id = module.vpc.vpc_id
}

module "igw" {
  source = "./modules/igw"
  vpc_id = module.vpc.vpc_id
}

module "route_tables" {
  source             = "./modules/route-tables"
  vpc_id             = module.vpc.vpc_id
  public_subnet_id   = module.subnets.public_subnet_id
  private_subnet_id  = module.subnets.private_subnet_id
  igw_id             = module.igw.igw_id
}

module "nat_gateway" {
  source           = "./modules/nat-gateway"
  public_subnet_id = module.subnets.public_subnet_id
  private_rt_id    = module.route_tables.private_rt_id
  igw_id           = module.igw.igw_id
}

module "security_groups" {
  source = "./modules/security-groups"
  vpc_id = module.vpc.vpc_id
}

module "nacls" {
  source            = "./modules/nacls"
  vpc_id            = module.vpc.vpc_id
  public_subnet_id  = module.subnets.public_subnet_id
  private_subnet_id = module.subnets.private_subnet_id
}

module "instances" {
  source = "./modules/instances"
  public_subnet_id  = module.subnets.public_subnet_id
  private_subnet_id = module.subnets.private_subnet_id
  public_sg_id      = module.security_groups.public_sg_id
  private_sg_id     = module.security_groups.private_sg_id
}
