#!/bin/bash
set -xe

export PATH=$PATH:/usr/bin:/home/ec2-user/.npm-global/bin

#!/bin/bash
set -e

cd /var/www/todo

# Kill any old proxy server still running
pm2 describe proxy > /dev/null 2>&1 && pm2 delete proxy || true

# Ensure no leftover PM2 process
pm2 describe todo > /dev/null 2>&1 && pm2 delete todo || true

# Load environment variables
export $(grep -v '^#' .env | xargs)

# Start the real app with PM2
pm2 start dist/index.js --name todo --watch

# Save PM2 so it restarts after reboot
pm2 save
