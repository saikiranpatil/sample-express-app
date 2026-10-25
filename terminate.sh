#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  printf 'Usage: %s <instance-id>\n' "$0" >&2
  exit 2
fi

aws ec2 terminate-instances \
  --instance-ids "$1" \
  --region "${AWS_REGION:-ap-south-2}"
