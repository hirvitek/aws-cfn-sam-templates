#!/bin/bash

# Simple deployment script with SAM
# Specify an argument to the script to override the environment
#  dev:   ./deploy.sh
#  prod:  ./deploy.sh production
#  stag:  ./deploy.sh staging
export ENV=${1:-dev}
export APPNAME=ecs-test-pipeline
PROJECT=${APPNAME}-${ENV}
PROFILE=default
REGION=us-west-2
TEMPLATE_NAME=services-pipeline

#cfn-lint validate ${TEMPLATE_NAME}.yaml || exit 1

## the actual deployment step
sam deploy --profile "${PROFILE}" --region "${REGION}" \
  --template-file ${TEMPLATE_NAME}.yaml \
  --stack-name "${PROJECT}" \
  --capabilities CAPABILITY_NAMED_IAM \
  --parameter-overrides \
  Environment="${ENV}" \
  Appname="${APPNAME}" \
  GitHubOwner=MatteoInfi \
  GitHubRepoUrl=https://github.com/MatteoInfi/web-service-test.git \
  GitHubRepo=web-service-test


