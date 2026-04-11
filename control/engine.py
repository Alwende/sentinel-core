import os, time, requests, psycopg2
from datetime import datetime

PROMETHEUS_GCP = os.getenv('PROMETHEUS_GCP')
SLACK_WEBHOOK = os.getenv('SLACK_WEBHOOK_URL')
DB_HOST = os.getenv('DB_HOST', 'sentinel-db')

def send_slack_alert(message):
    if SLACK_WEBHOOK:
        try:
            requests.post(SLACK_WEBHOOK, json={'text': message}, timeout=5)
        except Exception as e:
            print(f"SLACK FAILURE: {e}")

def get_telemetry(url):
    start = time.time()
    try:
        r = requests.get(url, params={'query': 'sum(up)'}, timeout=5)
        latency = (time.time() - start) * 1000
        data = r.json()
        # Corrected: Prometheus returns data['data']['result']['value']
        val = float(data['data']['result']['value'])
        return val, latency
    except Exception as e:
        return 0.0, (time.time() - start) * 1000

print("🛡️ SENTINEL-CORE v5.2.0-GOLD | GCP PRODUCTION")
while True:
    if PROMETHEUS_GCP:
        val, lat = get_telemetry(PROMETHEUS_GCP)
        status = "HEALTHY" if val >= 1.0 else "DEGRADED"
        if status == "DEGRADED":
            send_slack_alert(f":rotating_light: SENTINEL AI ALERT [GCP-US-CENTRAL]: Service {status}! Metric: {val} | Latency: {lat:.2f}ms")
        print(f"[{datetime.now()}] GCP: {status} ({val}) - Latency: {lat:.2f}ms")
    time.sleep(10)
