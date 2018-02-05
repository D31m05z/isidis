#!/bin/bash

# opencubic
apt install --no-install-recommends opencubicplayer

# conky
apt install --no-install-recommends conky
cp ./config/conky/conky.conf /etc/conky/conky.conf
# git clone https://github.com/brndnmtthws/conky.git

# install MITMf framework
./mitmf-install.sh

# install Veil framwwork
./veil-install.sh

