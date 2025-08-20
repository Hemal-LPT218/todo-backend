#!/bin/bash
set -xe

export PATH=$PATH:/usr/bin:/home/ec2-user/.npm-global/bin

cd /var/www/todo

# stop proxy server
pm2 describe proxy > /dev/null 2>&1 && pm2 delete proxy || true

# stop existing app if exists
pm2 describe todo > /dev/null 2>&1 && pm2 delete todo || true

# export env vars
export $(grep -v '^#' .env | xargs)

# make sure PORT matches TG
export PORT=80

# start app
/usr/bin/pm2 start dist/index.js --name todo --watch