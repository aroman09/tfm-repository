output "nlb_dns" {
  description = "DNS name of the Network Load Balancer"
  value       = module.nlb.nlb_dns_name
}