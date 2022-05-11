pkg_set summary "C library for reading, creating, and modifying zip archives"
pkg_set webpage "https://libzip.org"
pkg_set src.url "https://libzip.org/download/libzip-1.7.0.tar.xz"
pkg_set src.sha "d26b2952426d2518f3db5cdeda4fe3cd668fc5bb38a598781e4d1d3f7f8ca7be"
pkg_set bsystem "cmake"

build() {
    cmakew \
    -DENABLE_GNUTLS=OFF \
    -DENABLE_OPENSSL=OFF \
    -DENABLE_MBEDTLS=OFF \
    -DENABLE_COMMONCRYPTO=OFF \
    -DENABLE_WINDOWS_CRYPTO=OFF \
    -DBUILD_DOC=OFF \
    -DBUILD_TOOLS=OFF \
    -DBUILD_REGRESS=OFF \
    -DBUILD_EXAMPLES=OFF
}
