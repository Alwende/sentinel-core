# Project Charter: Sentinel-Core (v1.0.0)
**Project ID:** P-17-AUDIT-2026  
**Lead Architect & PM:** Alwende, PMP  

---

## 1. Executive Summary & Business Case
In the modern 2026 enterprise landscape, infrastructure downtime is a direct threat to business continuity. Sentinel-Core is engineered to provide an automated, low-footprint diagnostic layer for Linux nodes. By standardized reporting of critical system metrics, we bridge the gap between "Manual Troubleshooting" and "Proactive Infrastructure Management."

## 2. Project Goals & Objectives
- **Standardization:** Establish a uniform audit format across all Linux distributions.
- **Velocity:** Achieve a full system health snapshot in under 2 seconds.
- **Portability:** Maintain a zero-dependency architecture (Pure POSIX Shell).
- **Automation:** Integrated CI/CD via GitHub Actions for continuous quality assurance.

## 3. Project Scope
### **In-Scope:**
- Real-time Disk Utilization auditing (`df`).
- Human-readable Volatile Memory analysis (`free`).
- Active User/Security session tracking (`who`).
- Automated logging with ISO-standard timestamps.
### **Out-of-Scope:**
- Network-level penetration testing.
- Graphical User Interface (GUI) development (Planned for v2.0).
- Remote database storage integration (Planned for v1.5).

## 4. Key Stakeholders
- **Systems Administrators:** Primary end-users.
- **PMO / IT Leadership:** Strategic oversight and resource planning.
- **DevOps Engineers:** Integration into automated deployment pipelines.

## 5. Risks, Constraints, and Assumptions
- **Constraint:** Must operate in restricted shell environments (minimal permissions).
- **Risk:** Variations in output formatting between GNU and BSD-based utilities.
- **Assumption:** Users have basic CLI access to the target nodes.

## 6. Success Criteria
- **Green Pipeline:** 100% pass rate on GitHub Actions CI/CD.
- **Clean Audit:** Zero critical errors during execution on Ubuntu 24.04+ (Noble).
- **Documentation:** Full clarity for third-party contributors via README and Charter.

---
**Approved By:** Alwende, Lead Architect  
**Date:** March 22, 2026
