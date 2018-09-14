#!/bin/bash

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
git clone https://github.com/D31m05z/i3lock-color.git
cd i3lock-color
git tag -f "git-$(git rev-parse --short HEAD)"
autoreconf -i && ./configure && make && make install
cd -
cp ./config/i3lock ~/.config/

# awesome
apt install awesome
git clone --recursive https://github.com/D31m05z/awesome-copycats.git ~/.config/awesome
cd ~/.config/awesome
mv rc.lua.ph0b05z rc.lua
cd -
