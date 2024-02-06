#!/bin/bash
slack_web='https://hooks.slack.com/services/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'
total_mem=$(free -m | grep -i mem | awk -F " " '{print $2}')
total_avl=$(free -m | grep -i mem | awk -F " " '{print $7}')
used_space=$(expr $total_mem - $total_avl)
echo "the total memory available is ${total_mem}MB and the current utilization is ${used_space} and the available space is ${total_avl}"
x=$(echo "scale=2; $total_avl / $total_mem" | bc | tr -d '.')
echo "the free memory percentage is ${x}%"
if [ $x -lt 10 ]
then
echo "memory is too low utilized by more than 90%"
curl -X POST ${slack_web} -sL -H 'Content-type: application/json' --data "{"text": \"current memory Utilization is : $(expr 100 - $x)%\"}" >>/dev/null
else
echo "you are fine with the memory and it is $(expr 100 - $x)% used"
fi