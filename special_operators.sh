#!/bin/bash
systemctl status nginx  --no-pager >/dev/null
if [ $? eq 0 ]; then 
echo "nginx is running"
else
echo "lets start the nginx server" 
systemctl start nginx --no-pager >/dev/null
fi