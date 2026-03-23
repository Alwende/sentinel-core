# 🛡️ Sentinel-Core Cloud Infrastructure (v1.2.0-alpha)
# Target: Amazon Web Services (AWS)

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1" # The heart of Amazon's infrastructure
}

# Placeholder for the Sentinel-Core Container Service
# This is where we will define the AWS Fargate cluster to run our Docker image
