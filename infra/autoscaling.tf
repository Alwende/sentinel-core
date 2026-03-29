resource "kubernetes_horizontal_pod_autoscaler" "sentinel_hpa" {
  metadata {
    name = "sentinel-core-hpa"
    namespace = "default"
  }
  spec {
    max_replicas = 1000
    min_replicas = 5
    target_cpu_utilization_percentage = 50
    scale_target_ref {
      api_version = "apps/v1"
      kind        = "Deployment"
      name        = "sentinel-core-deployment"
    }
  }
}
