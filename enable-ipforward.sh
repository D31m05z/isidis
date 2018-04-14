#!/bin/bash

source 00.sh

cat /proc/sys/net/ipv4/ip_forward

echo 1 > /proc/sys/net/ipv4/ip_forward

result=$(cat /proc/sys/net/ipv4/ip_forward)

echo $result

if [ $result -eq 0 ]; then
    notify "ip forwarding failed"
else
    notify "ip forwarding succesfully"
fi
