#!/bin/bash
# Builds FreeTDS for X86_64 using the macOS SDK

OUTPUT="$(readlink -f ~/Desktop)/freetds/macos/x64"
HOST="x86_64-apple-darwin"         #Machine building for
BUILD="aarch64-apple-darwin22.6.0" #Machine building on
CFLAGS="-arch x86_64 -masm=intel"

./autogen.sh --prefix=${OUTPUT} --host=${HOST} -build ${BUILD} CFLAGS="${CFLAGS}"
make
sudo make install
