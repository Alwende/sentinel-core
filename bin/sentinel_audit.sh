set -e  # Exit immediately if a command fails
set -u  # Treat unset variables as an error#!/bin/bash

# --- The Sentinel Auditor ---
# Purpose: Professional System Health Audit
# Author: alwende (Principal Architect)

REPORT_FILE="system_audit_$(date +%Y%m%d).log"

echo "------------------------------------------" >> $REPORT_FILE
echo "AUDIT TIMESTAMP: $(date)" >> $REPORT_FILE
echo "------------------------------------------" >> $REPORT_FILE

# 1. CHECK DISK SPACE (The 'Warehouse' capacity)
echo " DISK SPACE AUDIT:" >> $REPORT_FILE
df -h | grep '^/dev/' >> $REPORT_FILE

# 2. CHECK MEMORY (The 'Oxygen' levels)
echo -e "\n MEMORY UTILIZATION:" >> $REPORT_FILE
free -h >> $REPORT_FILE

# 3. CHECK WHO IS ON THE SYSTEM (The 'Security' check)
echo -e "\n ACTIVE USERS:" >> $REPORT_FILE
who >> $REPORT_FILE

echo "SUCCESS: Sentinel-Core has audited your node."echo -e "\nAUDIT COMPLETE. Report saved to $REPORT_FILE"
