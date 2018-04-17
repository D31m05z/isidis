#!/bin/bash

#statements
apt-get install -y --no-install-recommends python-dev python-setuptools libpcap0.8-dev libnetfilter-queue-dev libssl-dev libjpeg-dev libxml2-dev libxslt1-dev libcapstone3 libcapstone-dev libffi-dev file

pip install virtualenvwrapper

source /usr/local/bin/virtualenvwrapper.sh

[ -d ./fr4m3w0rk/MITMf ] && rm -rf ./fr4m3w0rk/MITMf

git clone https://github.com/byt3bl33d3r/MITMf ./fr4m3w0rk/MITMf

cd ./fr4m3w0rk/MITMf && git submodule init && git submodule update --recursive

rmvirtualenv Ph0b05z
mkvirtualenv -p /usr/bin/python2.7 -r ./requirements.txt Ph0b05z

python mitmf.py --help
