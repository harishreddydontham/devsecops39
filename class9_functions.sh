#Delete Volumes Less than 5GB In size
#!/bin/bash
delete_vols() {
    vols=$(aws ec2 describe-volumes --region us-east-2 | jq ".Volumes[].VolumeId" | tr -d '"')
    for vol in $vols; do
        status=$(aws ec2 describe-volumes --volume-ids $vol | jq ".Volumes[].Attachments[].State" | tr -d '"')
        if [[ ${status} = 'attached' ]]; then
            echo "$vol is  in use by ec2 instance dont delete it"
        else
            echo "Deleting Volume $vol"
            aws ec2 delete-volume --volume-id $vol
        fi
    done
}

delete_vols

* * * * * sudo bash /root/unttached_ebs.sh us-east-1
