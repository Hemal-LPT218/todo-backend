#!/bin/bash
cd /var/www/todo

# make sure ec2-user owns the code directory
sudo chown -R ec2-user:ec2-user /var/www/todo

# npm ci --production || true
npm install --only=production