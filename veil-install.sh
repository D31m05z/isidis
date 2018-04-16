#!/bin/bash

[ -d Veil ] && rm -rf Veil

xhost +

git clone https://github.com/D31m05z/Veil.git

cd Veil

./config/update-config.py

./config/setup.sh --silent

xhost -
