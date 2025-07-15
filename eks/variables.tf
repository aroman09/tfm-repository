variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "subnet_private_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "eks_cluster_name" {
  description = "Name for the EKS cluster"
  type        = string
  default     = "eks-tfm"
}

variable "node_group_name" {
  description = "Name of the EKS node group"
  type        = string
  default     = "eks-tfm-ng"
}

variable "eks_cluster_role_arn" {
  description = "IAM Role ARN for EKS Cluster (LabRole)"
  type        = string
}

variable "eks_node_role_arn" {
  description = "IAM Role ARN for EKS Node Group (LabRole)"
  type        = string
}

variable "nlb_dns" {
  description = "DNS name of the NLB (informational only)"
  type        = string
}
