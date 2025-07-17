provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "kubernetes_namespace" "monitoring" {
  metadata {
    name = "monitoring"
  }
}

resource "helm_release" "kube_prometheus_stack" {
  name       = "kps"
  namespace  = kubernetes_namespace.monitoring.metadata[0].name
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  version    = "57.0.3"
  create_namespace = false

  values = [
    <<-EOF
    grafana:
      service:
        type: LoadBalancer
    kube-state-metrics:
      enabled: true
      metricAllowlist:
        - kube_hpa_status_current_replicas
      collectors:
        - horizontalpodautoscaler
      metricLabelsAllowlist:
        - pods=[*]
        - deployments=[*]
        - horizontalpodautoscalers=[*]
    EOF
  ]
}

# metrics-server
resource "helm_release" "metrics_server" {
  name       = "metrics-server"
  namespace  = "kube-system"
  repository = "https://kubernetes-sigs.github.io/metrics-server/"
  chart      = "metrics-server"
  version    = "3.12.1"

  values = [<<EOF
    args:
      - --kubelet-insecure-tls
      - --kubelet-preferred-address-types=InternalIP
    EOF
  ]
}