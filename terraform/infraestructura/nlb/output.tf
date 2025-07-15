output "nlb_dns_name" {
  description = "The DNS name of the Network Load Balancer"
  value       = aws_lb.tfm_nlb.dns_name
}