# 📄 Project Charter: Sentinel-Core Enterprise (v2.1.0)

**Project ID:** P-21-SENTINEL-GKE-2026  
**Lead Architect & PM:** Dan Alwende, PMP  
**Current Status:** Production / Active Deployment  
**Last Updated:** March 24, 2026  

---

## 1. Executive Summary & Business Case
In the 2026 hyper-connected economy, infrastructure downtime for financial institutions like KCB or Equity Bank translates directly to massive revenue loss and reputational damage. **Sentinel-Core v2.1.0** has evolved from a local diagnostic agent into a **Distributed Cloud-Native Observability Platform**. 

By migrating from standalone Bash scripts to a **Google Kubernetes Engine (GKE)** orchestrated environment, we have solved the problem of "Silent Failures." Sentinel-Core now provides a centralized, real-time "Single Pane of Glass" for monitoring global node health, ensuring that system bottlenecks are identified and mitigated before they impact the end-user.

### Strategic Justification:
* **Operational Resilience:** Automates the monitoring of 10,000+ distributed nodes.
* **Cost Optimization:** Uses ultra-slim Alpine-based containers to minimize cloud compute overhead.
* **Data-Driven Leadership:** Provides executives with live hardware telemetry (CPU/RAM/Disk) to inform capacity planning.

---

## 2. Project Goals & High-Level Objectives
* **Global Observability (v2.1.0):** Deliver a web-based SaaS dashboard accessible via Global Load Balancer.
* **Real-Time Telemetry:** Achieve a <5-second polling interval for critical hardware metrics using the `psutil` integration.
* **High Availability:** Utilize GKE self-healing and auto-scaling to ensure 99.99% uptime of the monitoring agent itself.
* **Security & Governance:** Implement VPC-level firewalling and Secret Management for all external integrations.

---

## 3. Project Scope

### In-Scope (The v2.1.0 Standard):
* **Orchestration:** Full Kubernetes (GKE) deployment with LoadBalancer Ingress.
* **Containerization:** Hardened Python 3.11-Alpine microservices.
* **Live Dashboard:** Flask-based UI with asynchronous JavaScript (AJAX) polling.
* **Hardware Interfacing:** Real-time extraction of CPU Load, Virtual Memory, and Partition usage.

### Out-of-Scope (Future Roadmapped):
* **Persistent Data Lake:** (Planned v2.5) Long-term metric storage via Prometheus/Grafana.
* **IAM Integration:** (Planned v2.5) Role-Based Access Control (RBAC) for dashboard users.
* **Multi-Cloud Failover:** (Planned v3.0) Disaster recovery across AWS and Azure.

---

## 4. Key Stakeholders
* **Executive Leadership (CIO/CTO):** Strategic ROI and system-wide health oversight.
* **SRE & DevOps Teams:** Primary operators managing cluster stability.
* **Compliance & Audit Teams:** Ensuring infrastructure meets banking-grade security standards.

---

## 5. Success Criteria & KPIs
* **MTTR Reduction:** Reduce Mean Time to Recovery by 40% through proactive telemetry.
* **Deployment Footprint:** Maintain a container image size under 100MB (Current: ~60MB).
* **Network Integrity:** Zero unauthorized access via strict VPC Ingress/Egress rules.
* **Scalability:** Successful horizontal pod autoscaling under simulated load of 5,000 requests/sec.

---

## 6. Formal Approval
**Lead Architect:** Dan Alwende, PMP  
**Organization:** Professional Open Source Systems Engineering  
**Date:** March 24, 2026
