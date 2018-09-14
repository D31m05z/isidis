#!/bin/bash

source 00.sh

if [ $(id -u) -ne 0 ]; then
    error "This script must be run as root"
fi

# update repository
apt update

# install Ph0b05z desktop
./ph0b05z/desktop-install.sh

# install tools
./ph0b05z/tools-install.sh

# install MITMf framework
./ph0b05z/mitmf-install.sh

# install Veil framwwork
./ph0b05z/veil-install.sh
