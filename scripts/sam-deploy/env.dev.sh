#!/usr/bin/env bash

# If you have an SSM parameter you can put the name here
PREFIX=${APPNAME}-${ENV}

export VPC_ID=${PREFIX}-vpc-id
export PUBLIC_SUBNET_1=${PREFIX}-publicSubnet1-id
