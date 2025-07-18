output "vpc_id" {
  value = module.vpc.vpc_id
}

output "subnet_private_ids" {
  value = module.networking.subnet_private_ids
}

output "subnet_public_ids" {
  value = module.networking.subnet_public_ids
}

output "nlb_dns" {
  value = module.nlb.nlb_dns_name
}
