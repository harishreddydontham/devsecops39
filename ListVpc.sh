#!/bin/bash
REGION=$@
for region in $REGION; do
echo "=========================="
aws ec2 describe-vpcs --region $region | jq ".Vpcs[].VpcId"
done
