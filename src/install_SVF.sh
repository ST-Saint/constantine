#!/bin/sh

#
# SVF
#
. ./setup.sh
git clone https://github.com/SVF-tools/SVF.git SVF --single-branch --branch SVF-1.9
cd SVF
git am -3 -k ../SVF-model-const.patch
git am -3 -k ../SVF-Field-Sensitivity.patch

mkdir Debug-build
cd Debug-build
cmake -D CMAKE_BUILD_TYPE:STRING=Debug ../
make -j$(nproc)
