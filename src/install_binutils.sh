#!/bin/sh

set -e

BINUTILS_VERSION=2.31.90

#
# Binutils
#
wget ftp://sourceware.org/pub/binutils/snapshots/binutils-${BINUTILS_VERSION}.tar.xz
tar xvfJ binutils-${BINUTILS_VERSION}.tar.xz
rm -f binutils-${BINUTILS_VERSION}.tar.xz
cd binutils-${BINUTILS_VERSION}
mkdir binutils-objects
cd binutils-objects
../configure --enable-gold --enable-plugins
make -j$(nproc) all-gold
