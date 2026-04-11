import os
from flask import Flask
from prometheus_client import start_http_server, Gauge

app = Flask(__name__)
HEALTH_STATUS = Gauge('sentinel_health_check', 'Health status of the engine')

@app.route('/')
def index():
    return "Sentinel Core is Running"

if __name__ == "__main__":
    # Start Prometheus metrics on 9090
    print("[SENTINEL] Starting Metrics Server on port 9090...", flush=True)
    start_http_server(9090)
    
    # Start Flask on 5000
    print("[SENTINEL] Starting Web UI on port 5000...", flush=True)
    HEALTH_STATUS.set(1)
    app.run(host='0.0.0.0', port=5000)
