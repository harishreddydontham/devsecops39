#!/bin/bash
servers=('10.1.1.100' '10.1.1.10' '10.1.1.4' '10.1.1.39')
rm -rf /tmp/reachable_servers
for server in ${servers[@]}
do
netcat -z -n -v -w3 $server 22 2>&1 | grep succeeded | cut -d " " -f3 >>/tmp/reachable_servers>
done
