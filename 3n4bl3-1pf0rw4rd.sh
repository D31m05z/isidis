#!/bin/bash

cat /proc/sys/net/ipv4/ip_forward

echo 1 > /proc/sys/net/ipv4/ip_forward

result=$(cat /proc/sys/net/ipv4/ip_forward)

echo $result

if [ $result -eq 0 ]; then
    echo "1pf0rw4rd1ng 3n4bl3d failed"
else
    echo "1pf0rw4rd1ng 3n4bl3d succesfully"
fi
