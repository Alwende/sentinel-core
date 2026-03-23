# 🛡️ Sentinel-Core Multi-Cloud Infrastructure (v1.2.0-alpha)
# Targets: AWS & Google Cloud Platform (GCP)

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

# --- AWS CONFIGURATION ---
provider "aws" {
  region = "us-east-1"
}

resource "aws_ecr_repository" "sentinel_aws_registry" {
  name                 = "sentinel-core-enterprise"
  image_scanning_configuration { scan_on_push = true }
}

# --- GOOGLE CLOUD CONFIGURATION ---
provider "google" {
  project = "charming-scarab-474407-i8" # We will replace this with your actual ID
  region  = "us-central1"
}

resource "google_artifact_registry_repository" "sentinel_gcp_registry" {
  location      = "us-central1"
  repository_id = "sentinel-core-enterprise"
  description   = "Sentinel-Core Private Docker Repository"
  format        = "DOCKER"
}

output "aws_registry_url" { value = aws_ecr_repository.sentinel_aws_registry.repository_url }
output "gcp_registry_url" { value = google_artifact_registry_repository.sentinel_gcp_registry.name }
