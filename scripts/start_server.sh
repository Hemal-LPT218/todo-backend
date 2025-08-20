#!/bin/bash
set -xe

cd /var/www/todo

npx prisma migrate deploy --schema=prisma/schema.prisma

export PM2_HOME=/home/ec2-user/.pm2

sudo -i -u ec2-user pm2 delete proxy || true

sudo -i -u ec2-user pm2 delete todo || true

sudo -i -u ec2-user pm2 start dist/index.js --name todo --watch
sudo -i -u ec2-user pm2 save
