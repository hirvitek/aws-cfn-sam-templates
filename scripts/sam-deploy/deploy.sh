#!/bin/bash

# Simple deployment script with SAM
# Specify an argument to the script to override the environment
#  dev:   ./deploy.sh
#  prod:  ./deploy.sh prod
#  stag:  ./deploy.sh stag
export ENV=${1:-dev}
export APPNAME=""
PROJECT=${APPNAME}-${ENV}
BUCKET=${PROJECT}-lambda-deployment-artifacts
PROFILE=default
REGION=ap-southeast-1
TEMPLATE_NAME=template

sam build

aws --profile "${PROFILE}" --region "${REGION}" s3 mb s3://"${BUCKET}"

sam package --profile "${PROFILE}" --region "${REGION}"  \
  --template-file .aws-sam/build/${TEMPLATE_NAME}.yaml \
  --output-template-file output.yaml \
  --s3-bucket "${BUCKET}"

# Source env variables for the template
. env."${ENV}".sh

## the actual deployment step
sam deploy --profile "${PROFILE}" --region "${REGION}" \
  --template-file output.yaml \
  --stack-name "${PROJECT}" \
  --capabilities CAPABILITY_IAM \
  --parameter-overrides \
  Environment="${ENV}" \
  Appname="${APPNAME}" \
  VPC="${VPC_ID}" \
  PublicSubnet1Id="${PUBLIC_SUBNET_1}"
