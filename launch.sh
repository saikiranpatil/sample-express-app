#!/usr/bin/env bash
set -euo pipefail

: "${AMI_ID:?Set AMI_ID to the ID of the AMI to launch}"
: "${INSTANCE_TYPE:?Set INSTANCE_TYPE to the EC2 instance type}"
: "${KEY_NAME:?Set KEY_NAME to the EC2 key pair name}"
: "${SECURITY_GROUP_ID:?Set SECURITY_GROUP_ID to a security group ID}"

region="${AWS_REGION:-ap-south-2}"
args=(
  ec2 run-instances
  --image-id "$AMI_ID"
  --instance-type "$INSTANCE_TYPE"
  --count 1
  --key-name "$KEY_NAME"
  --security-group-ids "$SECURITY_GROUP_ID"
  --region "$region"
  --query 'Instances[0].InstanceId'
  --output text
)

if [[ -n "${SUBNET_ID:-}" ]]; then
  args+=(--subnet-id "$SUBNET_ID")
fi

aws "${args[@]}"
