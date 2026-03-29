#!/bin/bash
LB_URL="http://a0a7e876746ea47cd865b4c0fd351fe1-1811083007.af-south-1.elb.amazonaws.com"
DEVICE_NAME=$(hostname)

echo "🚀 Sentinel Agent Starting for $DEVICE_NAME..."
while true; do
  CPU=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
  curl -X POST -H "Content-Type: application/json" -d "{\"device\":\"$DEVICE_NAME\", \"cpu\":$CPU}" $LB_URL/api/report
  echo "📊 Reported $CPU% CPU to Dashboard"
  sleep 10
done
