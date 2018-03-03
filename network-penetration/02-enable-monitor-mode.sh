#!/bin/bash

source 00.sh

if [ $(id -u) -ne 0 ]; then
    error "This script must be run as root"
fi

[ -z $1 ] && error "The device interface name is mandatory. ex.: ./02-enable-monitor-mode.sh wlan1 --airmon"
[ -z $2 ] && error "The enable methode must be provided.
                    You can choose three different way to enable the monitor mode.
		    --airmon
		    --airmon-kill
		    --native
		    ex.: ./02-enable-monitor.mode.sh wlan1 --airmon"
[ ! -d "/sys/class/net/$1" ] && error "network dosen't exist $1"

case "$2" in
	--airmon)
		airmon-ng start $1
        ;;
	--airmon-kill)
		ifconfig $1 down
		airmon-ng check kill
		airmon-ng start $1
	;;
	--native)
		ifconfig $1 down
		iwconfig $1 mode monitor
		ifconfig $1 up
	;;
	*)
		error "invalid monitor mode enable methode selected $2"
	;;
esac

notify "network $1 monitor mode enabled"

