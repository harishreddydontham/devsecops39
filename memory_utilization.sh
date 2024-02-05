#!/bin/bash
total_mem=$(free -m | grep -i mem | awk -F " " '{print $2}')
total_avl=$(free -m | grep -i mem | awk -F " " '{print $7}')
used_space=$(expr $total_mem - $total_avl)
echo "the total memory available is ${total_mem}MB and the current utilization is ${used_space} and the available space is ${total_avl}"
avl_space_in_per=$(echo "scale=2; $total_avl / $total_mem" | bc -l) | tr -d '.'


