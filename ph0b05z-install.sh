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

# i3lock
apt install -y libev-dev libxcb* libxkbcommon-dev libxkbcommon-x11-dev libpam0g-dev
git clone https://github.com/PandorasFox/i3lock-color.git
cd i3lock-color
git tag -f "git-$(git rev-parse --short HEAD)"
autoreconf -i && ./configure && make && make install
cd -
cp ./config/i3lock ~/.config/


# install MITMf framework
./ph0b05z/mitmf-install.sh

# install Veil framwwork
./ph0b05z/veil-install.sh

