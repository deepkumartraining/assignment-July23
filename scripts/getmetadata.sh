#!/bin/bash

# Step 1: Get instance ID from the instance's metadata
TEMP_INSTANCE_ID=$(aws ec2 describe-instances --instance-id $(curl -s http://169.254.169.254/latest/meta-data/instance-id) --query 'Reservations[].Instances[].InstanceId')
INSTANCE_ID=$(echo $TEMP_INSTANCE_ID | awk -F'"' '{print $2}')

# Step 2: Check if AWS CLI is installed
if ! command -v aws &>/dev/null; then
  echo "AWS CLI is not installed. Please install it and configure AWS credentials."
  exit 1
fi

# Step 3: Check if AWS credentials are configured
if ! aws configure get aws_access_key_id &>/dev/null; then
  echo "AWS credentials are not configured. Please run 'aws configure' to set them up."
  exit 1
fi

# Step 4: Query instance metadata using AWS CLI and format the output as JSON
METADATA_JSON=$(aws ec2 describe-instances --instance-ids "$INSTANCE_ID" --query 'Reservations[].Instances[].{InstanceId:InstanceId,InstanceType:InstanceType,PrivateIpAddress:PrivateIpAddress,PublicIpAddress:PublicIpAddress}' --output json)

# Step 5: Check if jq is installed
if ! command -v jq &>/dev/null; then
  echo "jq is not installed. Please install it to parse JSON output."
  exit 1
fi

# Step 6: Print the formatted JSON output
echo "$METADATA_JSON" | jq .

# Step 7: Define DATA_KEY and change according to requirement
DATA_KEY="PublicIpAddress"

# Step 8: Data key value
DATA_VALUE=$(echo "$METADATA_JSON" | jq .[0].$DATA_KEY | awk -F'"' '{print $2}')

# Step 9: Desired output
echo "Desired DATA KEY($DATA_KEY) value is:- $DATA_VALUE"