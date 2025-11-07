#!/bin/bash
# ==============================
# Start Java Application
# ==============================

echo "Starting Java application..."

# Navigate to deployment directory
cd /opt/myapp

# Find the JAR file (assuming CodeDeploy copies it here)
JAR_FILE=$(find . -type f -name "*.jar" | head -n 1)

if [ -z "$JAR_FILE" ]; then
  echo "❌ ERROR: No JAR file found to run!"
  exit 1
fi

# Start the application in background
nohup java -jar "$JAR_FILE" > app.log 2>&1 &

echo "✅ Java application started successfully!"
