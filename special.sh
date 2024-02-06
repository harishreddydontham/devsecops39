#!/bin/bash
if [ $# -gt 0 ]; then
for region in $@ 
do
echo "==================================================="
aws ec2 describe-vpcs --region $region | jq ".Vpcs[].VpcId"
done
else
echo "give atleast  1 parameter to the script"
fi