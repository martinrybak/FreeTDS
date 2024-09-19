#!/bin/bash
# Builds FreeTDS for arm64 using the iPhone SDK

OUTPUT="$(readlink -f ~/Desktop)/freetds/ios/arm64"
SDK=`xcrun --sdk iphoneos --show-sdk-path`
HOST="aarch64-apple-darwin"   #Machine building for
BUILD="aarch64-apple-darwin22.6.0"  #Machine building on
CFLAGS="-isysroot ${SDK}"

./autogen.sh --prefix=${OUTPUT} --host=${HOST} -build ${BUILD} CFLAGS="${CFLAGS}"
make
sudo make install
