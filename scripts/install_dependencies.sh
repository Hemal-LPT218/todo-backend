#!/bin/bash
# set -xe

# export PATH=$PATH:/usr/bin:/home/ec2-user/.npm-global/bin
 # Create app directory
mkdir -p /home/ec2-user/app
cd /home/ec2-user/app

# Fix permissions
chown -R ec2-user:ec2-user /home/ec2-user/app
# sudo chown -R ec2-user:ec2-user /var/www/todo

# Install dependencies cleanly
# rm -rf node_modules
npm install