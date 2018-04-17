#!/bin/bash

[ -d ./fr4m3w0rk/Veil ] && rm -rf ./fr4m3w0rk/Veil

xhost +

git clone https://github.com/D31m05z/Veil.git ./fr4m3w0rk/Veil

cd ./fr4m3w0rk/Veil

./config/update-config.py

./config/setup.sh --silent

xhost -
