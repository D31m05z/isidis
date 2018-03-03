#!/bin/bash

export BLUE='\033[1;94m'
export GREEN='\033[1;92m'
export RED='\033[1;91m'
export RESETCOLOR='\033[1;00m'

function notify {
    if [ -e /usr/bin/notify-send ]; then
            /usr/bin/notify-send "Ph0b05z" "$1"
    fi
}
export notify

function error {
    echo -e -e "\n$GREEN[$RED!$GREEN] $RED $1$RESETCOLOR\n" >&2
    exit 1
}

if [ $(id -u) -ne 0 ]; then
    error "This script must be run as root"
fi

[ ! -d "/sys/class/net/$1" ] && error "network dosen't exist $1"

ifconfig $1 down
macchanger --random $1
ifconfig $1 up

notify "network $1 mac address changed"
