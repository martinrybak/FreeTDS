#Building on macOS

##Dependencies

`brew install autoconf automake libtool libiconv gettext gperf pkg-config`

##Build

###macOS

####Intel

`./autogen-macos-x64.sh`

####Apple Silicon

`./autogen-macos-arm64.sh`

###iOS

####Devices

`./autogen-ios-arm64.sh`

####Simulator

`./autogen-ios-x64.sh`

##Output
All builds will be in `freetds` folder on `~/Desktop`

##Install Name
The dylib's internal "install path" will point to the `freetds` desktop folder. Before embedding in an app, we have to make this path relative:

`sudo install_name_tool -id "@rpath/libsybdb.dylib" libsybdb.dylib`

##Installation

Rename the `libsybdb.5.dylib` file to `libsybdb.dylib` and copy to the root folder of your Xcode project.

Drag and drop this file from Finder onto your Xcode project settings under `General` > `Frameworks, Libraries, and Embedded Content`.

Xcode will take care of the build phases and references.