output "eks_cluster_name" {
  description = "EKS Cluster Name"
  value       = aws_eks_cluster.tfm_eks.name
}

output "eks_cluster_endpoint" {
  description = "EKS Cluster Endpoint"
  value       = aws_eks_cluster.tfm_eks.endpoint
}

output "nlb_dns_name" {
  description = "NLB DNS Name (provided manually)"
  value       = var.nlb_dns
}
