#!/bin/bash
# Creates a single Framework for all FreeTDS dylibs

FOLDER="$(readlink -f ~/Desktop)/freetds"

# Merge macos libs, otherwise get the following error:
# Both 'macos-arm64' and 'macos-x86_64' represent two equivalent library definitions.
lipo -create \
$FOLDER/macos/arm64/lib/libsybdb.5.dylib \
$FOLDER/macos/x64/lib/libsybdb.5.dylib \
-output $FOLDER/macos/merged/libsybdb.dylib
install_name_tool -id libsybdb.dylib $FOLDER/macos/merged/libsybdb.dylib

# Give the ios libs a unique dylib name
install_name_tool -id libsybdb-ios-arm64.dylib $FOLDER/ios/arm64/lib/libsybdb.dylib
install_name_tool -id libsybdb-ios-x64.dylib $FOLDER/ios/x64/lib/libsybdb.dylib

# Build unified framework
xcodebuild \
  -create-xcframework \
  -library $FOLDER/macos/merged/libsybdb.dylib \
  -headers $FOLDER/ios/x64/include \
  -library $FOLDER/ios/arm64/lib/libsybdb.dylib \
  -headers $FOLDER/ios/x64/include \
  -library $FOLDER/ios/x64/lib/libsybdb.dylib \
  -headers $FOLDER/ios/x64/include \
  -output $FOLDER/FreeTDS.xcframework

# Sign framework
codesign -s "Apple Development: Martin Rybak (CGRC4A3EW4)" -f $FOLDER/FreeTDS.xcframework
