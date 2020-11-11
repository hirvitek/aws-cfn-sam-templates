#!/usr/bin/env bash

STACK_NAME=organizations

TARGET_ACCOUNTS_PROFILES=(
 # Here your AWS cli profiles for the accounts
)

# Deploy master account
aws cloudformation deploy \
  --template-file masterAccountPermissions.yaml \
  --stack-name "${STACK_NAME}" \
  --capabilities CAPABILITY_NAMED_IAM

# Deploy target accounts
for i in "${TARGET_ACCOUNTS_PROFILES[@]}"; do

    aws --profile "${i}" cloudformation deploy \
      --template-file targetAccountsPermissions.yaml \
      --stack-name "${STACK_NAME}-staksets-permissions" \
      --capabilities CAPABILITY_NAMED_IAM \
      --parameter-overrides \
        MasterAccount=""

done
