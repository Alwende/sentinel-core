# 🛡️ Sentinel-Core
"Visibility is the first step toward stability. Impact is the only legacy."

Sentinel-Core is an enterprise-grade Cloud-Native monitoring solution. v2.1.0 transitions from a standalone auditor to a globally distributed Kubernetes SaaS platform with real-time telemetry.

**Live Production Dashboard:** [http://34.28.252.118](http://34.28.252.118)

**Version:** 2.1.0 | **Lead Architect:** Dan Alwende, PMP | **License:** MIT

---

## 🚀 Deployment Evolution
* **v1.0.0:** Core Bash Engine & CI/CD.
* **v1.1.0:** Slack Webhook Alerts & Secret Management.
* **v2.1.0:** (CURRENT) GKE Orchestration, Dockerized Flask Dashboard, & Real-time Telemetry.

## 🏗️ Cloud-Native Architecture
The system is now fully containerized and orchestrated:
* **Container:** Python 3.11-Alpine (Optimized ~60MB).
* **Orchestration:** Google Kubernetes Engine (GKE).
* **Infrastructure:** Terraform-managed VPC & Cluster.
* **Networking:** Global LoadBalancer with automated Health Checks.

## 📊 Core Capabilities
* **Real-Time Telemetry:** Live CPU, Memory, and Disk usage via `psutil` and Flask.
* **Automated Scalability:** Kubernetes-managed replicas for 10,000+ device monitoring.
* **Cloud-First Logging:** Centralized audit logs across distributed nodes.
* **Global Accessibility:** Static-assigned VIP for executive oversight.

## 🗺️ Roadmap (2026 Strategy)
- [✅] **v1.0 - v1.1:** Local Auditing & Slack Integration.
- [✅] **v2.0:** Kubernetes Production Cluster (GKE).
- [✅] **v2.1:** Real-time SaaS Dashboard Integration.
- [▶️] **v2.5:** Prometheus/Grafana Deep-Metrics & Multi-Cloud IAM.

---
© 2026 | Professional Open Source Systems Engineering
