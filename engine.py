import numpy as np
import psutil
import base64
from datetime import datetime

class SentinelAIOps:
    def __init__(self, history_size=60):
        self.history = []
        self.history_size = history_size

    def calculate_anomaly(self, current_value):
        if len(self.history) < 10:
            self.history.append(current_value)
            return False
        mean = np.mean(self.history)
        std_dev = np.std(self.history)
        z_score = (current_value - mean) / std_dev if std_dev > 0 else 0
        self.history.append(current_value)
        if len(self.history) > self.history_size: self.history.pop(0)
        return abs(z_score) > 3

    def execute_active_remediation(self, pid, reason):
        try:
            p = psutil.Process(pid)
            p.terminate()
            log_entry = f"ALERT: AIOps terminated PID {pid} | Reason: {reason}"
            print(base64.b64encode(log_entry.encode()).decode())
        except: pass

ai_engine = SentinelAIOps()

def monitor_cycle():
    cpu_usage = psutil.cpu_percent()
    if ai_engine.calculate_anomaly(cpu_usage):
        for proc in psutil.process_iter(['pid', 'cpu_percent']):
            if proc.info['cpu_percent'] > 50:
                ai_engine.execute_active_remediation(proc.info['pid'], "AIOps: Predictive Anomaly Detected")

if __name__ == "__main__":
    print("Sentinel-Core v5.4.0-AIOps Initialized...")
    while True:
        monitor_cycle()
