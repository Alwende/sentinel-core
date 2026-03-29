import os
import time
import requests
import psutil
from flask import Flask, jsonify

app = Flask(__name__)

# --- Verified v2.2.0 Configuration ---
SLACK_URL = os.environ.get("SLACK_WEBHOOK_URL")
COOLDOWN = 3600  # 1 Hour silence for the SAME issue

alert_state = {
    "cpu": {"status": "OK", "last_notified": 0},
    "memory": {"status": "OK", "last_notified": 0},
    "disk": {"status": "OK", "last_notified": 0}
}

def send_alert(metric, value, severity):
    if not SLACK_URL: return
    emoji = "🔴" if severity == "CRITICAL" else "⚠️"
    payload = {
        "text": f"{emoji} *SENTINEL ALERT*\n*Status:* {severity}\n*Host:* {os.uname()}\n*Metric:* {metric}\n*Value:* {value}%"
    }
    try:
        requests.post(SLACK_URL, json=payload, timeout=5)
    except Exception as e:
        print(f"Slack failed: {e}")

def monitor_logic():
    cpu = psutil.cpu_percent()
    mem = psutil.virtual_memory().percent
    disk = psutil.disk_usage('/').percent
    now = time.time()
    metrics = [("cpu", cpu, 80, 95), ("memory", mem, 85, 95), ("disk", disk, 85, 95)]
    for name, val, warn, crit in metrics:
        severity = "CRITICAL" if val >= crit else ("WARNING" if val >= warn else "OK")
        state = alert_state[name]
        if severity != "OK":
            if severity != state["status"] or (now - state["last_notified"] > COOLDOWN):
                send_alert(name, val, severity)
                alert_state[name] = {"status": severity, "last_notified": now}
        else:
            alert_state[name]["status"] = "OK"

@app.route('/health')
def health():
    monitor_logic()
    return jsonify({"status": "active", "version": "v2.2.0-smart"}), 200

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
