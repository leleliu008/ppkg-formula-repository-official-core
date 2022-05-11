pkg_set summary "QR Code generation"
pkg_set webpage "https://fukuchi.org/works/qrencode"
pkg_set src.url "https://fukuchi.org/works/qrencode/qrencode-4.0.2.tar.gz"
pkg_set src.sha "dbabe79c07614625d1f74d8c0ae2ee5358c4e27eab8fd8fe31f9365f821a3b1d"
pkg_set bsystem "cmake"
pkg_set dep.pkg "libpng"

build() {
    cmakew \
        -DWITH_TOOLS=ON \
        -DWITH_TESTS=OFF \
        -DWITHOUT_PNG=OFF \
        -DPNG_PNG_INCLUDE_DIR="$libpng_INCLUDE_DIR" \
        -DPNG_LIBRARY_RELEASE="$libpng_LIBRARY_DIR/libpng.a" \
        -DZLIB_LIBRARY_RELEASE="$zlib_LIBRARY_DIR/libz.a"
}
