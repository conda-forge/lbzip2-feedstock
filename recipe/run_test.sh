#!/usr/bin/env bash

# compress using lbzip2 and decompress using bzip2
[[ $(echo "SOME CONTENT" | lbzip2 -c | bzip2 -d) == "SOME CONTENT" ]] || exit 1
