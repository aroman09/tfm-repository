resource "aws_eks_cluster" "tfm_eks" {
  name     = var.eks_cluster_name
  role_arn = var.eks_cluster_role_arn

  vpc_config {
    subnet_ids              = var.subnet_private_ids
    endpoint_public_access   = true
    endpoint_private_access  = true
  }
}

resource "aws_eks_node_group" "tfm_node_group" {
  cluster_name    = aws_eks_cluster.tfm_eks.name
  node_group_name = var.node_group_name
  node_role_arn   = var.eks_node_role_arn
  subnet_ids      = var.subnet_private_ids
  scaling_config {
    desired_size = 2
    max_size     = 4
    min_size     = 2
  }
  instance_types = ["t3.medium"]
}
