#!/bin/bash
set -e
export PATH=$PATH:/usr/bin

# Stop both proxy and app if running
pm2 delete proxy || true
pm2 delete todo || true
