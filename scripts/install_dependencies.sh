#!/bin/bash
# set -xe

# export PATH=$PATH:/usr/bin:/home/ec2-user/.npm-global/bin

cd /home/ec2-user/app

# Fix permissions
# sudo chown -R ec2-user:ec2-user /var/www/todo

# Install dependencies cleanly
rm -rf node_modules
npm install