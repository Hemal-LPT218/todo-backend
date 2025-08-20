#!/bin/bash
set -e
export PATH=$PATH:/usr/bin

cd /var/www/todo

# npm ci --production || true
npm install --only=production