pkg_set summary "QR Code generation"
pkg_set webpage "https://fukuchi.org/works/qrencode"
pkg_set src.url "https://fukuchi.org/works/qrencode/qrencode-4.1.1.tar.gz"
pkg_set src.sha "da448ed4f52aba6bcb0cd48cac0dd51b8692bccc4cd127431402fca6f8171e8e"
pkg_set git.url "https://github.com/fukuchi/libqrencode.git"
pkg_set license "LGPL-2.1-or-later"
pkg_set depends "libpng"
pkg_set bsystem "cmake"

build() {
    cmakew \
        -DWITH_TOOLS=ON \
        -DWITH_TESTS=OFF \
        -DWITHOUT_PNG=OFF \
        -DPNG_PNG_INCLUDE_DIR="$libpng_INCLUDE_DIR" \
        -DPNG_LIBRARY_RELEASE="$libpng_LIBRARY_DIR/libpng.a" \
        -DZLIB_LIBRARY_RELEASE="$zlib_LIBRARY_DIR/libz.a"
}
