#!/bin/bash
set -xe

cd /var/www/todo

npx prisma migrate deploy --schema=prisma/schema.prisma

export PM2_HOME=/home/ec2-user/.pm2

sudo pm2 delete proxy || true

sudo pm2 delete todo || true

pm2 start dist/index.js --name todo --watch
pm2 save
