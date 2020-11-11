#!/usr/bin/env bash

GLOBAL_STACK_NAME=waves-organization
REGION=ap-southeast-1

aws cloudformation update-stack-set \
    --stack-set-name ${GLOBAL_STACK_NAME} \
    --template-body file://organizationsSetup.yaml \
    --region ${REGION} \
    --capabilities=CAPABILITY_NAMED_IAM \
    --parameter-overrides \
      MasterAccount="" \
      DevAccount="" \
      ProdAccount=""

#aws cloudformation update-stack-instances \
#    --stack-set-name ${GLOBAL_STACK_NAME} \
#    --regions ${REGION} \
#    --accounts "076034880409" "283094985920" "932241063471" \
#    --operation-preferences MaxConcurrentPercentage=50

