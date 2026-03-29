from flask import Flask, render_template_string, jsonify
import psutil, os, psycopg2, requests
from datetime import datetime

app = Flask(__name__)
DB_HOST = os.getenv("DB_HOST", "sentinel-db")
CLOUD_NAME = os.getenv("CLOUD_NAME", "Enterprise-Node")
SLACK_URL = os.getenv("SLACK_URL")

def get_db_connection():
    return psycopg2.connect(host=DB_HOST, database="sentinel_db", user="admin", password="password", connect_timeout=3)

@app.route("/data")
def data():
    cpu = psutil.cpu_percent(interval=None)
    mem = psutil.virtual_memory().percent
    try:
        if cpu > 80 and SLACK_URL:
            requests.post(SLACK_URL, json={"text": f"SENTINEL ALERT [{CLOUD_NAME}]: CPU at {cpu}%"}, timeout=2)
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute("INSERT INTO health_logs (cpu_usage, timestamp) VALUES (%s, %s)", (cpu, datetime.now()))
        conn.commit()
        cur.execute("SELECT cpu_usage, timestamp FROM health_logs ORDER BY timestamp DESC LIMIT 10")
        rows = cur.fetchall()
        cur.close()
        conn.close()
        history = [{"usage": float(row[0]), "time": row[1].strftime("%H:%M:%S")} for row in rows]
        return jsonify(cpu=cpu, mem=mem, history=history, status="STABLE", cloud=CLOUD_NAME)
    except Exception as e:
        return jsonify(cpu=cpu, mem=mem, history=[], status="DB_OFFLINE", cloud=CLOUD_NAME, error=str(e))

@app.route("/")
def index():
    return render_template_string("""<body style=\"font-family:sans-serif; background:#0d1117; color:white; text-align:center; padding:20px;\"><h1>🛡 Sentinel AI v4.2.0</h1><h2>Cloud: <span style=\"color:#58a6ff;\">{{ cloud }}</span></h2><div style=\"background:#161b22; border:1px solid #30363d; padding:20px; border-radius:12px; max-width:800px; margin:auto;\"><h3>Status: <span id=\"status\">INIT</span></h3><p>CPU: <span id=\"cpu\">0</span>% | MEM: <span id=\"mem\">0</span>%</p><canvas id=\"chart\"></canvas></div><script src=\"https://cdn.jsdelivr.net/npm/chart.js\"></script><script>const ctx = document.getElementById(\"chart\").getContext(\"2d\");const chart = new Chart(ctx, {type: \"line\",data: { labels: [], datasets: [{ label: \"CPU Load\", data: [], borderColor: \"#58a6ff\", fill: true }] }});setInterval(() => {fetch(\"/data\").then(res => res.json()).then(data => {document.getElementById(\"status\").innerText = data.status;document.getElementById(\"cpu\").innerText = data.cpu;document.getElementById(\"mem\").innerText = data.mem;if (data.history.length > 0) {chart.data.labels = data.history.map(h => h.time).reverse();chart.data.datasets[0].data = data.history.map(h => h.usage).reverse();chart.update();}});}, 3000);</script></body>""", cloud=CLOUD_NAME)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
