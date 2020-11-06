#!/bin/bash

# Simple deployment script with SAM
# Specify an argument to the script to override the environment
#  dev:   ./deploy.sh
#  prod:  ./deploy.sh production
#  stag:  ./deploy.sh staging
export ENV=${1:-dev}
export APPNAME=""
PROJECT=${APPNAME}-${ENV}
PROFILE=default
REGION=ap-southeast-1

# Source env variables for the template
. env."${ENV}".sh

## the actual deployment step
sam deploy --profile "${PROFILE}" --region "${REGION}" \
  --template-file template.yaml \
  --stack-name "${PROJECT}" \
  --capabilities CAPABILITY_IAM \
  --parameter-overrides \
  Environment="${ENV}" \
  Appname="${APPNAME}" \
  VPC="${VPC_ID}" \
  PublicSubnet1Id="${PUBLIC_SUBNET_1}"

