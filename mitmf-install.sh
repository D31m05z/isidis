#!/bin/bash

#statements
apt-get install -y --no-install-recommends python-dev python-setuptools libpcap0.8-dev libnetfilter-queue-dev libssl-dev libjpeg-dev libxml2-dev libxslt1-dev libcapstone3 libcapstone-dev libffi-dev file

pip install virtualenvwrapper

source /usr/local/bin/virtualenvwrapper.sh

[ -d MITMf ] && rm -rf MITMf

git clone https://github.com/byt3bl33d3r/MITMf

cd MITMf && git submodule init && git submodule update --recursive

rmvirtualenv MITMf
mkvirtualenv -p /usr/bin/python2.7 -r ./requirements.txt MITMf

python mitmf.py --help
