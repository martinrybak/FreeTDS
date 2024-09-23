#!/bin/bash
# Builds FreeTDS for arm64 using the macOS SDK

OUTPUT="$(readlink -f ~/Desktop)/freetds/macos/arm64"
HOST="arm-apple-darwin"   #Machine building for
BUILD="x86_64-apple-darwin" #Machine building on
CFLAGS="-arch arm64"

./autogen.sh --prefix=${OUTPUT} --host=${HOST} -build ${BUILD} CFLAGS="${CFLAGS}"
make
sudo make install
