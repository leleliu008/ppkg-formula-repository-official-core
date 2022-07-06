pkg_set summary "C library for reading, creating, and modifying zip archives"
pkg_set webpage "https://libzip.org"
pkg_set src.url "https://libzip.org/download/libzip-1.8.0.tar.xz"
pkg_set src.sha "f0763bda24ba947e80430be787c4b068d8b6aa6027a26a19923f0acfa3dac97e"
pkg_set git.url "https://github.com/nih-at/libzip.git"
pkg_set dep.pkg "zstd bzip2"
pkg_set bsystem "cmake"

build() {
    cmakew \
        -DENABLE_ZSTD=ON \
        -DENABLE_LZMA=ON \
        -DENABLE_BZIP2=ON \
        -DENABLE_GNUTLS=OFF \
        -DENABLE_OPENSSL=OFF \
        -DENABLE_MBEDTLS=OFF \
        -DENABLE_COMMONCRYPTO=OFF \
        -DENABLE_WINDOWS_CRYPTO=OFF \
        -DBUILD_DOC=OFF \
        -DBUILD_TOOLS=OFF \
        -DBUILD_REGRESS=OFF \
        -DBUILD_EXAMPLES=OFF
    sed_in_place 's|-lZstd|-lzstd|' "$PACKAGE_INSTALL_DIR/lib/pkgconfig/libzip.pc"
}
