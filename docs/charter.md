# 📄 Project Charter: Sentinel-Core Enterprise (v2.0.0)

**Project ID:** P-20-SENTINEL-GKE-2026
**Lead Architect & PM:** Dan Alwende, PMP
**Current Status:** Production Release Candidate (v2.0.0)
**Last Updated:** March 24, 2026

---

## 1. Executive Summary: The Business Need
In the high-velocity banking and tech sectors (KCB, Equity, Oracle), **Observability is a Profit Center.** Every second of "Unknown System State" is a potential million-dollar outage. 

### The Problem:
Existing enterprise solutions are "Resource Heavy" and "Cost Prohibitive." Organizations are paying 20% "Monitoring Tax" on their cloud bills, often with agents that require complex manual installation.

### The Business Case:
**Sentinel-Core v2.0.0** solves this by providing a **High-Availability, Low-Footprint Monitoring SaaS**. We have moved from a local Bash script to a **Google Kubernetes Engine (GKE)** architecture. This transition allows for zero-touch deployment and instant global visibility across 10,000+ nodes with a hardware overhead of less than 1%.

---

## 2. The Sentinel Solution
Our solution provides a **Single Pane of Glass** for distributed infrastructure. 
* **Zero-Downtime Orchestration:** Using GKE to ensure the auditor never goes down.
* **Hardened Microservices:** Alpine-based containers that reduce the attack surface for banking-grade security.
* **Global Accessibility:** Integrated Load Balancing for executive-level oversight from any location.

---

## 3. Product Features & Roadmap (v2.0.0 Focus)

### Current Capabilities (v2.0.0 Stable):
* **Cloud-Native Deployment:** Fully automated GKE orchestration.
* **LoadBalancer Integration:** External VIP access for decentralized monitoring.
* **Resource Optimization:** Sub-100MB container footprint (Currently ~60MB).
* **VPC-Level Security:** Priority-based firewalling and automated ingress control.

### In-Development (v2.1.0):
* **Real-Time Telemetry:** Live hardware polling via `psutil`.
* **AJAX Dashboard:** Asynchronous UI updates without page refreshes.

---

## 4. Market Positioning: Why Sentinel-Core?
| Feature | Sentinel-Core | Traditional Agents (Datadog/NewRelic) |
| :--- | :--- | :--- |
| **Resource Usage** | < 1% CPU/RAM | 5% - 15% CPU/RAM |
| **Cost** | Open Source / Internal | Heavy SaaS Licensing Fees |
| **Deployment** | 1-Click K8s Manifest | Complex Agent Installation |
| **Security** | Internal VPC Hardened | Third-Party Data Exposure |

---

## 5. Success Criteria & KPIs
* **MTTR Reduction:** 40% improvement in Mean Time to Recovery.
* **Cloud spend:** 15% reduction in monitoring-related compute costs.
* **Global Reach:** 100% reachability of the public-facing LoadBalancer IP.

---

## 6. Formal Approval
**Lead Architect:** Dan Alwende, PMP
**Organization:** Professional Open Source Systems Engineering
**Date:** March 24, 2026
