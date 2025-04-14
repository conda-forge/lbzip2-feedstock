#!/bin/sh

# gnulib-tool is needed to generate the ./configure - it is supposed to be picked up as source
# and included in applications:
#
# From: https://www.gnu.org/software/gnulib/
#
#   Gnulib is a central location for common GNU code, intended to be shared among GNU packages.
#   GCC has libiberty, but this is hard to disentangle from the GCC build tree.
#
#   Gnulib takes a different approach. Its components are intended to be shared at the source level,
#   rather than being a library that gets built, installed, and linked against. Thus, there is no
#   distribution tarball; the idea is to copy files from Gnulib into your own source tree.

wget https://github.com/coreutils/gnulib/archive/refs/tags/v1.0.tar.gz
tar xvf v1.0.tar.gz

export PATH=${PATH}:${PWD}/gnulib-1.0

build-aux/autogen.sh
./configure --prefix=$PREFIX
make -j${CPU_COUNT} 
if [[ "${CONDA_BUILD_CROSS_COMPILATION:-0}" != "1" ]]; then
    make check         # [build_platform == target_platform]
fi
make install
