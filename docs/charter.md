# 📄 Project Charter: Sentinel-Core Enterprise (v2.1.0)

**Project ID:** P-21-SENTINEL-GKE-2026
**Lead Architect & PM:** Dan Alwende, PMP
**Current Status:** Production / Active Deployment

## 1. Executive Summary
Sentinel-Core has evolved from a diagnostic script (v1.1) into a **Distributed Cloud-Native Observability Platform (v2.1.0)**. We provide real-time hardware telemetry for 10,000+ nodes using GKE orchestration.

## 2. Technical Solution
* **Orchestration:** GKE (Google Kubernetes Engine) for 99.9% availability.
* **Telemetry:** Real-time `psutil` polling for CPU, RAM, and Disk.
* **UI:** Flask + AJAX Dashboard for live monitoring at http://34.28.252.118.
* **Efficiency:** Hardened <70MB Alpine containers to minimize cloud overhead.

## 3. Success Criteria
* **MTTR Reduction:** 40% faster incident response.
* **Global Access:** Load-balanced VIP accessibility.
* **Security:** VPC-hardened ingress/egress controls.

---
© 2026 | Professional Open Source Systems Engineering
