#!/bin/bash

export BLUE='\033[1;94m'
export GREEN='\033[1;92m'
export RED='\033[1;91m'
export RESETCOLOR='\033[1;00m'

function status {
    echo -e -e "\n$GREEN[*] $BLUE $1$RESETCOLOR\n" >&2
}
export status

function error {
    echo -e -e "\n$GREEN[$RED!$GREEN] $RED $1$RESETCOLOR\n" >&2
    exit 1
}
export error

function notify {
    if [ -e /usr/bin/notify-send ]; then
            /usr/bin/notify-send "Ph0b05z" "$1"
    else
        status $1
    fi
}
export notify
