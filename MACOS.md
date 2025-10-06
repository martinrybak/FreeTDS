#Building on macOS

##Dependencies

`brew install autoconf automake libtool libiconv gettext gperf`

##Configure

`autoreconf -i`

`./configure --with-gnutls  --enable-silent-rules --prefix=/tmp/freetds`

##Build

`./autogen-macos-arm64.sh` for arm64 on macOS
`./autogen-macos-x64.sh` for X64 on macOS

##Output
Output will be in `freetds` folder on `~/Desktop`