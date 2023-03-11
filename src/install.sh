#!/bin/sh

set -e
export MAKEFLAGS="-j $(grep -c ^processor /proc/cpuinfo)"

#
# Setup script
#
echo > setup.sh
chmod +x setup.sh
echo '#!/bin/sh'                                                    >> setup.sh
echo 'LLVM_VERSION=9'                                               >> setup.sh
echo 'BINUTILS_VERSION=2.31.90'                                     >> setup.sh
echo 'export LLVM_SRC=`pwd`/llvm-${LLVM_VERSION}'                   >> setup.sh
echo 'export LLVM_OBJ=$LLVM_SRC/llvm-objects'                       >> setup.sh
echo 'export LLVM_DIR=$LLVM_OBJ'                                    >> setup.sh
echo 'export SVF_HOME=`pwd`/SVF'                                    >> setup.sh
echo 'export PATH=$LLVM_DIR/bin:$SVF_HOME/Debug-build/bin:$PATH'    >> setup.sh
echo 'export PIN_ROOT=`pwd`/pin314'                                 >> setup.sh

echo "Use . ./setup.sh to set up your environment."
