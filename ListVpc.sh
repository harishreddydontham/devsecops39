#!/bin/bash

REGION="us-east-2"
aws ec2 describe-vpcs --region $REGION | jq ".Vpcs[].VpcId"
