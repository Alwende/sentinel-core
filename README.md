# 🛡️ Sentinel-Core | v2.1.0 (Production)
> **"Visibility is the first step toward stability. Impact is the only legacy."**

**Sentinel-Core** is a high-performance, Multi-Cloud Observability Platform. v2.1.0 marks the full transition from a localized diagnostic tool into a globally orchestrated **SaaS Infrastructure**.

## 🌐 Enterprise Command Center
* **Live Production URL:** [http://34.28.252.118](http://34.28.252.118)
* **Infrastructure:** GKE & AWS EKS Compatibility

## 🚀 The Evolution
| Version | Phase | Core Milestone | Status |
| :--- | :--- | :--- | :--- |
| **v1.0.0** | **The Engine** | Baseline Bash Auditor & CI/CD. | Legacy |
| **v1.5.0** | **Visualization** | Centralized Flask Dashboard. | Stable |
| **v2.0.0** | **Cloud-Native** | GKE/EKS Orchestration. | Stable |
| **v2.1.0** | **SaaS Production** | **Current:** Real-Time Telemetry. | **ACTIVE** |

## 🏗️ Solutions Architecture
### 1. The Chassis (Containerization)
* **Base:** `python:3.11-alpine` (~60MB footprint).
* **Logic:** Flask-based API via `psutil`.

### 2. The Engine (Orchestration & HA)
* **Multi-Cloud:** Engineered for **GCP GKE** and **AWS EKS**.
* **Self-Healing:** Kubernetes-managed pods with auto-scaling.

## 📊 Core Capabilities
* **Real-Time Telemetry:** Asynchronous polling of CPU/RAM/Disk.
* **Scalability:** Designed for 10,000+ distributed nodes.

## 🗺️ 2026 Strategic Roadmap
- [✅] **M1-M5:** Local Engine, Slack Alerts, Multi-Cloud VPC.
- [✅] **M6:** Kubernetes Production Cluster (GKE/EKS).
- [✅] **M7:** Real-time Dashboard & Telemetry Injection (v2.1.0).
- [▶️] **M8:** **Persistence Layer:** Prometheus/Grafana Integration.

## 📑 Governance & Support
* **Project Charter:** [docs/charter.md](docs/charter.md)
* **Execution Strategy:** [docs/strategy.md](docs/strategy.md)

**Lead Architect:** Dan Alwende, PMP  
**Organization:** Professional Open Source Systems Engineering  
**License:** MIT
