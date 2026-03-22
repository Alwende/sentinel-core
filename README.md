# 🛡️ Sentinel-Core
> **"Visibility is the first step toward stability. Impact is the only legacy."**

Sentinel-Core is a professional-grade Linux system health auditor engineered for the "Trenches." It provides real-time, high-fidelity visibility into critical node metrics, allowing Architects and PMOs to maintain 99.9% uptime with surgical precision.

[![Sentinel-Core CI](https://github.com/Alwende/sentinel-core/actions/workflows/pipeline.yml/badge.svg)](https://github.com/Alwende/sentinel-core/actions)
![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)
![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-blue.svg)

---

## 📋 Table of Contents
- [Quick Start](#-quick-start)
- [Architecture](#-architecture)
- [Core Capabilities](#-core-capabilities)
- [Roadmap](#-roadmap)
- [Project Charter](#-project-charter)

## 🚀 Quick Start
Deploy the Sentinel-Core auditor in under 10 seconds:

\`\`\`bash
# Clone the repository
git clone https://github.com/Alwende/sentinel-core.git

# Enter the binary directory
cd sentinel-core/bin

# Grant execution power and run
chmod +x sentinel_audit.sh
./sentinel_audit.sh
\`\`\`

## 🏗️ Architecture
The project follows a modular, enterprise-standard directory structure:
- **`/bin`**: Contains the `sentinel_audit.sh` core engine.
- **`/docs`**: Contains the formal Project Charter and strategic specifications.
- **`.github`**: Contains the CI/CD Automation Pipeline (GitHub Actions).

## 📊 Core Capabilities
- **Warehouse Audit:** Detailed disk space analysis across all mounted partitions.
- **Oxygen Monitor:** Human-readable RAM and Swap utilization metrics.
- **Security Sentinel:** Real-time tracking of active user sessions and TTY origins.
- **Persistent Logging:** Automated generation of timestamped audit logs for historical analysis.

## 🗺️ Roadmap (2026 Strategy)
- [x] **v1.0:** Core Engine & CI/CD Pipeline.
- [ ] **v1.1:** Slack/Telegram Webhook notifications for critical resource alerts.
- [ ] **v1.2:** Containerization via Docker for Cloud-Native deployments.
- [ ] **v1.5:** Web-based centralized dashboard (Python/Flask).

## 🏛️ Project Charter
For the full strategic overview, business case, and success metrics, please refer to the [Official Project Charter](docs/CHARTER.md).

---
**Lead Architect:** [Alwende](https://github.com/Alwende), PMP  
**License:** [MIT License](LICENSE)  
© 2026 | Professional Open Source Systems Engineering
