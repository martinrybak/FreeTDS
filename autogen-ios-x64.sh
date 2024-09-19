#!/bin/bash
# Builds FreeTDS for X86_64 using the iPhone Simulator SDK

OUTPUT="$(readlink -f ~/Desktop)/freetds/ios/x64"
SDK=`xcrun --sdk iphonesimulator --show-sdk-path`
HOST="x86_64-apple-darwin"   #Machine building for
BUILD="aarch64-apple-darwin22.6.0" #Machine building on
CFLAGS="-arch x86_64 -masm=intel -isysroot ${SDK}"

./autogen.sh --prefix=${OUTPUT} --host=${HOST} -build ${BUILD} CFLAGS="${CFLAGS}"
make
sudo make install
