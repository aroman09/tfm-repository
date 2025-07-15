output "argocd_namespace" {
  description = "Namespace where ArgoCD was deployed"
  value       = kubernetes_namespace.argocd.metadata[0].name
}