#!/bin/bash

set -e

source 00.sh

if [ $(id -u) -ne 0 ]; then
    error "This script must be run as root"
fi

[ -z $1 ] && error "The device interface name is mandatory. ex.: ./02-change-wlan-mode.sh wlan1 airmon monitor"

[ -z $2 ] && error "The enable methode is must be provided.
                    You can choose three different way to enable the monitor mode.
		    airmon
		    airmon-kill
		    native
		    ex.: ./02-change-wlan-.mode.sh wlan1 airmon"

[ -z $3 ] && error "The network mode is must be provided.
                    monitor
		    managed
		    ex.: ./02-change-wlan-mode.sh wlan1 airmon monitor"

[ ! -d "/sys/class/net/$1" ] && error "network dosen't exist $1"

case "$3" in
	monitor|managed)
		status "command: $1 $2 $3"
	;;
	*)
		error "invalid monitor mode selected $3"
	;;
esac

case "$2" in
	airmon)
		if [ $3 == "monitor" ]; then
			airmon-ng start $1
		else
			airmon-ng stop $1
		fi
  ;;
	airmon-kill)
		ifconfig $1 down
		airmon-ng check kill
		if [ $3 == "monitor" ]; then
			airmon-ng start $1
		else
			airmon-ng stop $1
		fi
	;;
	native)
		ifconfig $1 down
		iwconfig $1 mode $3
		ifconfig $1 up
	;;
	*)
		error "invalid monitor mode enable methode selected $2"
	;;
esac

interfaces=$(iw dev | awk '$1=="Interface"{print $2}')

for device in $interfaces; do
	if [ -z "$(iwconfig $device | grep Monitor)" ]; then
		status "monitor mode $GREEN disabled $RESETCOLOR on $device"
	else
		status "monitor mode $RED enabled $RESETCOLOR on $device"
	fi
done

notify "network $1 monitor mode changed to $3"
