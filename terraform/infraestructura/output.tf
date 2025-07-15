output "vpc_id" {
  value = module.vpc.vpc_id
}

output "subnet_private_id" {
  value = module.networking.subnet_private_id
}

output "subnet_private_id_2" {
  value = module.networking.subnet_private_id_2
}

output "subnet_public_id" {
  value = module.networking.subnet_public_id
}

output "nlb_dns" {
  value = module.nlb.nlb_dns_name
}
