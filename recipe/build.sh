#!/bin/sh

# add meta.yaml downloaded gnulib-tool to the path to generate the
# necessary autoconf content for autogen.sh

export PATH=${PATH}:${PWD}/gnulib

build-aux/autogen.sh

./configure --prefix=$PREFIX
make -j${CPU_COUNT} 
make check
make install
