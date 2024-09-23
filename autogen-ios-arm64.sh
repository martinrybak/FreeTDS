#!/bin/bash
# Builds FreeTDS for arm64 using the iPhone SDK

OUTPUT="$(readlink -f ~/Desktop)/freetds/ios/arm64"
SDK=`xcrun --sdk iphoneos --show-sdk-path`
HOST="arm-apple-darwin"   #Machine building for
BUILD="x86_64-apple-darwin"  #Machine building on
CFLAGS="-arch arm64 -isysroot ${SDK}"

./autogen.sh --prefix=${OUTPUT} --host=${HOST} -build ${BUILD} CFLAGS="${CFLAGS}"
make
sudo make install
