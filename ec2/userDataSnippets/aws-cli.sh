#!/usr/bin/env bash

# You can add and customize those snippets into EC2 UserData
# Install aws cli
yum install -y unzip
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install
