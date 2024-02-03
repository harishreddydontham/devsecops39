#!/bin/bash
REGION=$@
for region In $REGION; do
aws ec2 describe-vpcs --region $region | jq ".Vpcs[].VpcId"
done
