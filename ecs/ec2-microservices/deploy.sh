#!/bin/bash

# Simple deployment script with SAM
# Specify an argument to the script to override the environment
#  dev:   ./deploy.sh infrastructures vpc
#  prod:  ./deploy.sh infrastructures vpc prod
#  stag:  ./deploy.sh infrastructures vpc stag
export ENV=${3:-dev}
export TEMPLATE_NAME=${2}
export PATH={1}
export APPNAME=""
PROJECT=${APPNAME}-${TEMPLATE_NAME}-${ENV}
PROFILE=default
REGION=ap-southeast-1
TEMPLATE_URL=${PATH}/${TEMPLATE_NAME}.yaml

cfn-lint "${TEMPLATE_URL}"

# Source env variables for the template
. env."${ENV}".sh

## the actual deployment step
sam deploy --profile "${PROFILE}" --region "${REGION}" \
  --template-file "${TEMPLATE_NAME}" \
  --stack-name "${PROJECT}" \
  --capabilities CAPABILITY_IAM \
  --parameter-overrides \
  Environment="${ENV}" \
  Appname="${APPNAME}" \
  VPC="${VPC_ID}" \
  PublicSubnet1="${PUBLIC_SUBNET_1}" \
  PublicSubnet2="${PUBLIC_SUBNET_2}" \
  PrivateSubnet1="${PRIVATE_SUBNET_1}" \
  PrivateSubnet2="${PRIVATE_SUBNET_2}" \
  ClusterArn="${CLUSTER_ARN}" \
  ScalingPolicyName="${SCALING_POLICY_NAME}" \
  AutoscalingGroupName="${AUTOSCALING_GROUP_NAME}" \
  LogGroupName="${LOG_GROUP_NAME}" \
  LoadBalancerArn="${ELB_ARN}" \
  LoadBalancerSecurityGroupId="${ELB_SECURITYGROUP_ID}"

