pkg_set summary "Library for USB device access"
pkg_set webpage "https://libusb.info"
pkg_set src.url "https://github.com/libusb/libusb/releases/download/v1.0.23/libusb-1.0.23.tar.bz2"
pkg_set src.sha "db11c06e958a82dac52cf3c65cb4dd2c3f339c8a988665110e0d24d19312ad8d"
pkg_set license "LGPL-2.1"
pkg_set bsystem "configure"

build() {
    configure \
        --disable-udev \
        --enable-examples-build
}
