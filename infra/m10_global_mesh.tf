provider "google" {
  project = "charming-scarab-474407-i8"
  region  = "us-central1"
}

resource "google_container_cluster" "sentinel_secondary" {
  name     = "sentinel-secondary-us"
  location = "us-central1"
  enable_autopilot = true
  deletion_protection = false
}

resource "google_compute_global_forwarding_rule" "sentinel_lb" {
  name       = "sentinel-global-lb"
  target     = google_compute_target_http_proxy.sentinel_proxy.id
  port_range = "80"
  load_balancing_scheme = "EXTERNAL"
}

resource "google_compute_target_http_proxy" "sentinel_proxy" {
  name    = "sentinel-proxy"
  url_map = google_compute_url_map.sentinel_map.id
}

resource "google_compute_url_map" "sentinel_map" {
  name            = "sentinel-global-map"
  default_service = google_compute_backend_service.sentinel_backend.id
}

resource "google_compute_backend_service" "sentinel_backend" {
  name      = "sentinel-backend-service"
  protocol  = "HTTP"
  load_balancing_scheme = "EXTERNAL"
}

# The Pivot: Standalone Standby Database (No 'master_instance_name' dependency)
resource "google_sql_database_instance" "sentinel_replica" {
  name             = "sentinel-ledger-standby-us"
  region           = "us-central1"
  database_version = "POSTGRES_15"
  deletion_protection = false
  
  settings {
    tier = "db-f1-micro"
  }
}
