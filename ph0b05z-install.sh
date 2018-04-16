#!/bin/bash

source 00.sh

if [ $(id -u) -ne 0 ]; then
    error "This script must be run as root"
fi

# update repository
apt update

# utils
apt install -y terminator git-gui

# opencubic
apt install -y --no-install-recommends opencubicplayer

# conky
apt install -y --no-install-recommends conky
cp ./config/conky/conky.conf /etc/conky/conky.conf
# git clone https://github.com/brndnmtthws/conky.git

# install MITMf framework
./mitmf-install.sh

# install Veil framwwork
#./veil-install.sh

