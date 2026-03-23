# 🛡️ Sentinel-Core
> **"Visibility is the first step toward stability. Impact is the only legacy."**

Sentinel-Core is a professional-grade Linux system health auditor. v1.1 now features **Active Alerting**, allowing for real-time notifications via Slack Webhooks to ensure 99.9% uptime.

[![Sentinel-Core CI](https://github.com/Alwende/sentinel-core/actions/workflows/pipeline.yml/badge.svg)](https://github.com/Alwende/sentinel-core/actions)
![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)
![Version: 1.1.0](https://img.shields.io/badge/Version-1.1.0-blue.svg)

---

## 📋 Table of Contents
- [Quick Start](#-quick-start)
- [Architecture](#-architecture)
- [Core Capabilities](#-core-capabilities)
- [Roadmap](#-roadmap)
- [Project Charter](#-project-charter)

## 🚀 Quick Start
Deploy the Sentinel-Core auditor in under 10 seconds:

```bash
# Clone the repository
git clone https://github.com/Alwende/sentinel-core.git

# Enter the binary directory
cd sentinel-core/bin

# Optional: Enable Slack Alerts by setting your Webhook URL
export SLACK_WEBHOOK_URL="your_webhook_url_here"

# Grant execution power and run
chmod +x sentinel_audit.sh
./sentinel_audit.sh
```

## 🏗️ Architecture
The project follows a modular, enterprise-standard directory structure:
- **`/bin`**: Contains the `sentinel_audit.sh` core engine.
- **`/docs`**: Contains the formal Project Charter and strategic specifications.
- **`.github`**: Contains the CI/CD Automation Pipeline (Secret-aware).

## 📊 Core Capabilities
- **Active Alerting (v1.1):** Real-time Slack notifications triggered when disk usage exceeds 90%.
- **Warehouse Audit:** Detailed disk space analysis across all mounted partitions.
- **Oxygen Monitor:** Human-readable RAM and Swap utilization metrics.
- **Security Sentinel:** Real-time tracking of active user sessions.
- **Persistent Logging:** Automated generation of timestamped audit logs.

## 🗺️ Roadmap (2026 Strategy)
- [x] **v1.0:** Core Engine & CI/CD Pipeline.
- [x] **v1.1:** Slack Webhook integration & Secret Management.
- [ ] **v1.2:** Containerization via Docker for Cloud-Native deployments.
- [ ] **v1.5:** Web-based centralized dashboard (Python/Flask).

## 🏛️ Project Charter
For the full strategic overview and business case, please refer to the [Official Project Charter](docs/CHARTER.md).

---
**Lead Architect:** [Alwende](https://github.com/Alwende), PMP  
**License:** [MIT License](LICENSE)  
© 2026 | Professional Open Source Systems Engineering
