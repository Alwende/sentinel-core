# 📄 Project Charter: Sentinel-Core Enterprise (v2.1.0)
**Project ID:** P-21-SENTINEL-GKE-2026 | **Lead Architect:** Dan Alwende, PMP

## 1. Executive Summary: The Business Need
Modern enterprises (KCB, Equity Bank, Oracle) lose millions per hour of downtime. **Sentinel-Core** solves the "Observability Gap" by providing a low-footprint, high-availability monitoring SaaS that replaces resource-heavy legacy agents.

## 2. The Solution (v2.1.0)
* **Architecture:** Google Kubernetes Engine (GKE) for 99.9% resilience.
* **Telemetry:** Real-time `psutil` injection for live hardware snapshots.
* **Access:** Global LoadBalancer VIP (http://34.28.252.118).
* **Efficiency:** <70MB Hardened Alpine containers to reduce cloud compute tax.

## 3. Strategic Roadmap
* [✅] **v1.0 - v1.1:** Core Engine & Slack Webhooks.
* [✅] **v2.0 - v2.1:** K8s Orchestration & Real-time SaaS Dashboard (CURRENT).
* [▶️] **v2.5:** Prometheus Persistence & Grafana Visualization.

---
© 2026 | Professional Open Source Systems Engineering
