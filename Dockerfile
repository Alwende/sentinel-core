# 🛡️ Sentinel-Core Enterprise Chassis (v1.2.0-alpha)
FROM alpine:latest

# Install necessary POSIX tools for execution and alerting
RUN apk add --no-cache bash curl

# Set internal working directory
WORKDIR /app

# Copy the audit engine into the container filesystem
COPY bin/sentinel_audit.sh /app/sentinel_audit.sh

# Grant execution permissions to the script
RUN chmod +x /app/sentinel_audit.sh

# Define the default command to execute the auditor
ENTRYPOINT ["/app/sentinel_audit.sh"]
