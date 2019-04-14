#!/usr/bin/env bash

mkdir build && pushd build

CFLAGS="${CFLAGS}" ${SRC_DIR}/configure --prefix=${PREFIX}

make -j${CPU_COUNT} ${VERBOSE_AT}
make check ${VERBOSE_AT}
make install
