resource "google_container_cluster" "sentinel_secondary" {
  name     = "sentinel-secondary-us"
  location = "us-central1"
  enable_autopilot = true
}

resource "google_compute_global_forwarding_rule" "sentinel_lb" {
  name       = "sentinel-global-lb"
  target     = "sentinel-target-proxy"
  port_range = "80"
}

resource "google_sql_database_instance" "sentinel_replica" {
  name                 = "sentinel-ledger-replica-us"
  master_instance_name = "sentinel-ledger-primary-eu"
  region               = "us-central1"
  database_version     = "POSTGRES_15"
  replica_configuration {
    failover_target = true
  }
}
