# 🛡️ Sentinel-Core Multi-Role Chassis (Verified Alpine)
FROM python:3.11-alpine

# Install system dependencies
RUN apk add --no-cache bash curl

WORKDIR /app
COPY . .

# Install Python requirements
RUN pip install --no-cache-dir flask

# Default to the Dashboard for the Container view
EXPOSE 5000
ENTRYPOINT ["python", "dashboard/app.py"]
