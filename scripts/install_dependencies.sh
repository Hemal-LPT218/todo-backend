#!/bin/bash
cd /var/www/todo

# stop proxy server
/usr/bin/pm2 delete proxy || true


npm ci --production || true