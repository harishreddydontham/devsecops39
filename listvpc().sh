#/bin/bash
REGION=$1
for region in $REGION; do
    echo "=========================="
    aws ec2 describe-vpcs --region $region | jq ".Vpcs[].VpcId"
done
