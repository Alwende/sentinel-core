# Project Charter: Sentinel-Core (v1.1.0)
**Project ID:** P-17-AUDIT-2026  
**Lead Architect & PM:** Alwende, PMP  

---

## 1. Executive Summary & Business Case
In the modern 2026 enterprise landscape, infrastructure downtime is a direct threat to business continuity. Sentinel-Core v1.1 evolves from a diagnostic tool into a **Proactive Monitoring Agent**. By integrating real-time alerting via Slack Webhooks, we reduce the "Mean Time to Detect" (MTTD) for critical resource exhaustion.

## 2. Project Goals & Objectives
- **Proactive Alerting (New):** Provide instant notifications for critical system thresholds.
- **Standardization:** Establish a uniform audit format across all Linux distributions.
- **Velocity:** Achieve a full system health snapshot in under 2 seconds.
- **Security:** Maintain strict "Secret Management" for API integrations (GitHub Secrets).

## 3. Project Scope
### **In-Scope:**
- **Active Slack Notifications:** Triggered on 90% disk utilization.
- Real-time Disk Utilization auditing (`df`).
- Human-readable Volatile Memory analysis (`free`).
- Active User/Security session tracking (`who`).
### **Out-of-Scope:**
- Containerization (Planned for **v1.2**).
- Graphical User Interface (GUI) development (Planned for v2.0).
- Remote database storage integration (Planned for v1.5).

## 4. Key Stakeholders
- **Systems Administrators:** Primary end-users.
- **SRE / DevOps Engineers:** Integration into automated alerting pipelines.
- **PMO / IT Leadership:** Strategic oversight and resource planning.

## 5. Success Criteria
- **Alert Delivery:** Successful receipt of Slack notifications from GitHub Cloud Runners.
- **Green Pipeline:** 100% pass rate on CI/CD with secret injection.
- **Governance:** Updated Charter and README reflecting v1.1 capabilities.

---
**Approved By:** Alwende, Lead Architect  
**Date:** March 22, 2026
