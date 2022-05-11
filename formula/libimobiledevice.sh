pkg_set summary "Library to communicate with iOS devices natively"
pkg_set webpage "https://www.libimobiledevice.org"
pkg_set git.url "https://github.com/libimobiledevice/libimobiledevice.git"
pkg_set src.url "https://github.com/libimobiledevice/libimobiledevice/releases/download/1.3.0/libimobiledevice-1.3.0.tar.bz2"
pkg_set src.sha "53f2640c6365cd9f302a6248f531822dc94a6cced3f17128d4479a77bd75b0f6"
pkg_set license "LGPL-2.1"
pkg_set bsystem "configure"
pkg_set dep.cmd "pkg-config"
pkg_set dep.pkg "openssl libusbmuxd"

build() {
    configure --without-cython
}
