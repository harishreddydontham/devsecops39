#!/bin/bash
servers=('10.1.1.100' '10.1.1.10' '10.1.1.4' '10.1.1.39')
for servers in ${servers[@]}
do
timeout 3 telnet $servers 22
done
