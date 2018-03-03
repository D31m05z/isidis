#!/bin/bash

source 00.sh

if [ $(id -u) -ne 0 ]; then
    error "This script must be run as root"
fi

[ -z $1 ] && error "The device interface name is mandatory. ex.: ./01-macchanger.sh wlan1"
[ ! -d "/sys/class/net/$1" ] && error "network dosen't exist $1"

ifconfig $1 down
macchanger --random $1
ifconfig $1 up

notify "network $1 mac address changed"
