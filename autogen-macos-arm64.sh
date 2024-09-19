#!/bin/bash
# Builds FreeTDS for arm64 using the macOS SDK

OUTPUT="$(readlink -f ~/Desktop)/freetds/macos/arm64"
HOST="aarch64-apple-darwin"   #Machine building for
BUILD="aarch64-apple-darwin22.6.0" #Machine building on

./autogen.sh --prefix=${OUTPUT} --host=${HOST} -build ${BUILD}
make
sudo make install
