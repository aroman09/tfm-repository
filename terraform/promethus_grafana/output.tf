output "monitoring_namespace" {
  description = "Namespace where monitoring stack was deployed"
  value       = kubernetes_namespace.monitoring.metadata[0].name
}
