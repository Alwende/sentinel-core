# 📄 Project Charter: Sentinel-Core Enterprise (v2.1.0)

**Project ID:** P-21-SENTINEL-GKE-2026  
**Lead Architect & PM:** Dan Alwende, PMP  
**Sponsor:** Professional Open Source Systems Engineering  
**Date:** March 24, 2026  

---

## 1. Project Purpose & Business Case
**Sentinel-Core** is designed to address the critical gap in lightweight, high-availability infrastructure monitoring. Current market solutions often impose a "Monitoring Tax," consuming significant system resources (CPU/RAM) just to observe the host. 

**Business Need:** Organizations operating at scale require real-time visibility into distributed node health without the overhead of heavy legacy agents. Sentinel-Core v2.1.0 leverages cloud-native orchestration to provide 99.9% uptime of the monitoring layer itself, ensuring business continuity and reducing Mean Time to Recovery (MTTR) by providing immediate telemetry.

## 2. Project Objectives & Success Criteria
* **Cloud-Native Resilience:** Successfully migrate 100% of core auditing logic to a multi-cloud (GCP/AWS) environment.
* **Low-Footprint Performance:** Maintain a containerized image size below 70MB to minimize compute overhead and attack surface.
* **Real-Time Telemetry:** Deliver live hardware metrics (CPU, Memory, Disk) via `psutil` integration with a polling frequency of <10 seconds.
* **Global Access:** Securely expose the monitoring dashboard via a Global Load Balancer VIP.

## 3. High-Level Requirements
* **Orchestration:** Deployment managed via K8s (GKE/EKS) for self-healing and auto-scaling.
* **Compatibility:** The agent must operate on a Python 3.11-Alpine base to ensure cross-platform portability.
* **Security:** All ingress controlled via VPC/IAM Firewall rules, restricting access to authorized administrative ports.

## 4. Risks, Assumptions, and Constraints
* **Assumptions:** Continuous availability of GKE/EKS Control Planes and Artifact Registries.
* **Constraints:** Budgetary limits on cloud spend require the use of Preemptible VMs/Spot instances where applicable.
* **Risks:** High-frequency polling may lead to network egress costs if not optimized; potential for API throttling on the cloud provider side.

## 5. Project Roadmap (Detailed Milestone History)
| Milestone | Version | Phase Description | Status |
| :--- | :--- | :--- | :--- |
| **M1** | v1.0.0 | **Core Engine:** Baseline Bash auditing & GitHub Actions CI/CD. | Complete |
| **M2** | v1.1.0 | **Active Alerting:** Slack Webhook integration & Secret Management. | Complete |
| **M3** | v1.2.0 | **Portability:** Containerization (Docker) & Local Image Registry. | Complete |
| **M4** | v1.5.0 | **Visualization:** Centralized Dashboard prototype (Flask/Python). | Complete |
| **M5** | v2.0.0 | **High Availability:** Multi-Cloud Orchestration (GKE/EKS) & VPC Infrastructure. | Complete |
| **M6** | v2.1.0 | **Production SaaS:** Real-time Telemetry, AWS IAM Integration & Global LB. | **Active** |
| **M7** | v2.5.0 | **Persistence:** Prometheus/Grafana Deep-Metrics & Data Lake. | Future |

## 6. Authorization
This document formally authorizes Dan Alwende, PMP, to apply organizational resources to the activities defined within the scope of Sentinel-Core v2.1.0.

---
**Signed:** Dan Alwende, PMP  
Lead Architect  
