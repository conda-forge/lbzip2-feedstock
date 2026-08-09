#!/bin/sh
# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* ./gnulib/build-aux

# add meta.yaml downloaded gnulib-tool to the path to generate the
# necessary autoconf content for autogen.sh

export PATH=${PATH}:${PWD}/gnulib

build-aux/autogen.sh

./configure --prefix=$PREFIX
make -j${CPU_COUNT} 
if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" != "1" || "${CROSSCOMPILING_EMULATOR:-}" != "" ]]; then
make check
fi
make install
