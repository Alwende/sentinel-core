from flask import Flask, render_template
import datetime

app = Flask(__name__)

@app.route('/')
def index():
    # Placeholder: In v1.5, this will pull from our Cloud SQL/S3 logs
    status = "Active"
    last_audit = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    return render_template('index.html', status=status, last_audit=last_audit)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
