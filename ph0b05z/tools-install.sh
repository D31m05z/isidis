#!/bin/bash

# hashcat
git clone https://github.com/hashcat/hashcat.git
cd hashcat
git submodule update --init
make
cd -

# hashcat utils
git clone https://github.com/hashcat/hashcat-utils.git
cd hashcat-utils
make
cd -

# airgeddon
git clone https://github.com/v1s1t0r1sh3r3/airgeddon.git
cd airgeddon
cd -
