#!/bin/bash
set -e
set -u

# --- CONFIGURATION ---
# Pulls URL from Environment Variable for Security
WEBHOOK_URL="${SLACK_WEBHOOK_URL:-}"
DISK_THRESHOLD=90  # Set to 90% for production use

# --- NOTIFICATION ENGINE ---
send_slack_alert() {
    local message=$1
    if [[ -n "$WEBHOOK_URL" ]]; then
        echo "Sending Slack Notification..."
        curl -s -X POST -H 'Content-type: application/json' \
        --data "{\"text\":\"🚨 *SENTINEL ALERT* 🚨\n> $message\"}" \
        "$WEBHOOK_URL" > /dev/null
    else
        echo "Warning: SLACK_WEBHOOK_URL not set. Skipping notification."
    fi
}

# --- AUDIT EXECUTION ---
LOG_FILE="system_audit_$(date +%Y%m%d).log"
echo "------------------------------------------" > "$LOG_FILE"
echo "AUDIT TIMESTAMP: $(date)" >> "$LOG_FILE"
echo "------------------------------------------" >> "$LOG_FILE"

# 1. DISK SPACE AUDIT
echo "DISK SPACE AUDIT:" >> "$LOG_FILE"
df -h / >> "$LOG_FILE"

# Logic: Extract % usage of root disk
USAGE=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')

if [ "$USAGE" -ge "$DISK_THRESHOLD" ]; then
    send_slack_alert "CRITICAL RESOURCE ALERT: Disk usage on *$(hostname)* is at ${USAGE}%!"
fi

# 2. MEMORY UTILIZATION
echo -e "\nMEMORY UTILIZATION:" >> "$LOG_FILE"
free -h >> "$LOG_FILE"

# 3. ACTIVE USERS
echo -e "\nACTIVE USERS:" >> "$LOG_FILE"
who >> "$LOG_FILE"

echo "AUDIT COMPLETE. Report saved to $LOG_FILE"
echo "SUCCESS: Sentinel-Core has audited your node."
