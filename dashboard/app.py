from flask import Flask, render_template, jsonify
import psutil
import datetime

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/api/status')
def status():
    # Real-time hardware telemetry
    report = {
        "status": "Active",
        "cpu_usage": f"{psutil.cpu_percent()}%",
        "memory_usage": f"{psutil.virtual_memory().percent}%",
        "disk_usage": f"{psutil.disk_usage('/').percent}%",
        "last_audit": datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    }
    return jsonify(report)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
