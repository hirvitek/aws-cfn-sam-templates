#!/usr/bin/env bash

# If you have an SSM parameter you can put the name here
PREFIX=${APPNAME}-${ENV}

export VPC_ID=${PREFIX}-vpc-id
export PUBLIC_SUBNET_1=${PREFIX}-publicSubnet1-id
export PUBLIC_SUBNET_2=${PREFIX}-publicSubnet2-id
export PRIVATE_SUBNET_1=${PREFIX}-privateSubnet1-id
export PRIVATE_SUBNET_2=${PREFIX}-privateSubnet2-id
export CLUSTER_ARN=${PREFIX}-cluster-arn
export SCALING_POLICY_NAME=${PREFIX}-scalingPolicy-name
export AUTOSCALING_GROUP_NAME=${PREFIX}-autoscalinggroup-name
export LOG_GROUP_NAME=${PREFIX}-logGroup-name
export ELB_ARN=${PREFIX}-elasticLoadBalancer-arn
export ELB_SECURITYGROUP_ID=${PREFIX}-securityGroup-id
