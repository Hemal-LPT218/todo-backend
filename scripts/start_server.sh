#!/bin/bash
cd /var/www/todo

# stop existing pm2 app if any
pm2 delete todo || true

# export env vars
export $(grep -v '^#' .env | xargs)

# make sure PORT matches TG
export PORT=80

# start app
pm2 start dist/index.js --name todo --watch
