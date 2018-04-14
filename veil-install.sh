#!/bin/bash

set -e

xhost +
cd /opt/
git clone https://github.com/Veil-Framework/Veil.git
bash /opt/Veil/setup/setup.sh -c
xhost -
