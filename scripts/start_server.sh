#!/bin/bash
set -e
export PATH=$PATH:/usr/bin

cd /var/www/todo

# Stop proxy if running
if pm2 describe proxy > /dev/null 2>&1; then
  echo "Stopping proxy server..."
  pm2 delete proxy || true
fi

# Stop old app if running
if pm2 describe todo > /dev/null 2>&1; then
  echo "Stopping old app..."
  pm2 delete todo || true
fi

# Load environment variables
export $(grep -v '^#' .env | xargs)

# Start the real app
pm2 start dist/index.js --name todo --watch

# Save PM2 state so it restarts on reboot
pm2 save
