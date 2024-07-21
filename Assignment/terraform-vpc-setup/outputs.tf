output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_id" {
  value = module.subnets.public_subnet_id
}

output "private_subnet_id" {
  value = module.subnets.private_subnet_id
}

output "igw_id" {
  value = module.igw.igw_id
}

output "private_rt_id" {
  value = module.route_tables.private_rt_id
}

output "public_sg_id" {
  value = module.security_groups.public_sg_id
}

output "private_sg_id" {
  value = module.security_groups.private_sg_id
}
