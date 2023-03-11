#!/bin/sh

apt update
apt install -y build-essential git cmake python ninja-build wget sudo xxd linux-tools-common linux-tools-generic flex bison python3-pip bc


# Dependencies for gem5
apt install build-essential git m4 scons zlib1g zlib1g-dev \
    libprotobuf-dev protobuf-compiler libprotoc-dev libgoogle-perftools-dev \
    python3-dev python libboost-all-dev pkg-config

pip3 install pandas scipy IPython

git config --global user.email "yayuwang@cs.ubc.ca"
git config --global user.name "Yayu Wang"
