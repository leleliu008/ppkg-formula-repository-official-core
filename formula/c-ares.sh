pkg_set summary "Asynchronous DNS library"
pkg_set webpage "https://c-ares.haxx.se"
pkg_set src.url "https://c-ares.haxx.se/download/c-ares-1.16.1.tar.gz"
pkg_set src.sha "d08312d0ecc3bd48eee0a4cc0d2137c9f194e0a28de2028928c0f6cae85f86ce"
pkg_set bsystem "configure"

build() {
    configure \
        --enable-warnings \
        --disable-werror \
        --disable-tests \
        --disable-code-coverage \
        --disable-libgcc
}
