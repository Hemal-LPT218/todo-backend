#!/bin/bash
cd /var/www/todo
# stop existing pm2 app if any, then start
pm2 delete todo || true
pm2 start npm --name todo -- start