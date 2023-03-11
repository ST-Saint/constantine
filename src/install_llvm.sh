#!/bin/sh

set -e

BINUTILS_VERSION=2.31.90
LLVM_VERSION=9

#
# LLVM (release mode)
#
git clone https://github.com/llvm/llvm-project.git llvm-${LLVM_VERSION} --single-branch --branch release/9.x
cd llvm-${LLVM_VERSION}
git am -3 -k ../LoopInfo_TopLevelLoops.patch
mkdir bin && mkdir debug_bin && mkdir llvm-objects && mkdir llvm-objects-debug
cd llvm-objects
cmake ../llvm -G "Unix Makefiles" -DLLVM_ENABLE_PROJECTS="clang;lld;compiler-rt" -DLLVM_EXTERNAL_CLANG_SOURCE_DIR=`pwd`/../clang -DLLVM_EXTERNAL_LLD_SOURCE_DIR=`pwd`/../lld -DLLVM_EXTERNAL_COMPILERRT_SOURCE_DIR=`pwd`/../compiler-rt -DLLVM_REQUIRES_RTTI=ON -DLLVM_ENABLE_ASSERTIONS=ON -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=`pwd`/../bin/ -DLLVM_BINUTILS_INCDIR=`pwd`/../../binutils-${BINUTILS_VERSION}/include/
make -j$(nproc) && make -j$(nproc) install
