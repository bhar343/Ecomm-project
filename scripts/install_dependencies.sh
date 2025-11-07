#!/bin/bash
# ==============================
# Install Java and dependencies
# ==============================

echo "Starting dependency installation..."

# Update system packages
yum update -y

# Install Java (Amazon Linux 2 or RHEL-based systems)
amazon-linux-extras install java-openjdk11 -y

# Create application directory if not exists
mkdir -p /opt/myapp

# Stop any running app process (if exists)
APP_PID=$(pgrep -f myapp.jar)
if [ -n "$APP_PID" ]; then
    echo "Stopping existing Java process (PID: $APP_PID)"
    kill -9 $APP_PID
fi

echo "Dependencies installed successfully."
