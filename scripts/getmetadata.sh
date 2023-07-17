#!/bin/bash

# Step 1: Get instance ID from the instance's metadata
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)

# Step 2: Check if AWS CLI is installed
if ! command -v aws &>/dev/null; then
  echo "AWS CLI is required."
  exit 1
fi

# Step 3: Check if AWS credentials are configured
if ! aws configure get aws_access_key_id &>/dev/null; then
  echo "AWS credentials needs to configured."
  exit 1
fi

# Step 4: Specify the desired data key to retrieve
DATA_KEY="PublicIpAddress"

# Step 5: Query instance metadata using AWS CLI and retrieve the desired data key
DATA_VALUE=$(aws ec2 describe-instances --instance-ids "$INSTANCE_ID" --query "Reservations[].Instances[].$DATA_KEY" --output text)

# Step 6: Print the retrieved data value
echo "$DATA_KEY: $DATA_VALUE"
