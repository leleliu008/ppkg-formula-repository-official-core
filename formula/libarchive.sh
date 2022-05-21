pkg_set summary "Multi-format archive and compression library"
pkg_set webpage "https://www.libarchive.org"
pkg_set src.url "https://www.libarchive.org/downloads/libarchive-3.4.3.tar.xz"
pkg_set src.sha "0bfc3fd40491768a88af8d9b86bf04a9e95b6d41a94f9292dbc0ec342288c05f"
pkg_set depends "libiconv expat openssl xz bzip2 lz4 lzo zstd"
pkg_set bsystem "configure"

build() {
    configure \
        --enable-xattr \
        --enable-acl \
        --enable-bsdtar=static \
        --enable-bsdcat=static \
        --enable-bsdcpio=static \
        --without-xml2 \
        --with-expat \
        --with-openssl \
        --without-mbedtls \
        --without-nettle \
        --without-cng \
        --with-zlib \
        --with-lzma \
        --with-bz2lib \
        --with-lz4 \
        --with-lzo2 \
        --with-zstd \
        --without-libb2 \
        --with-iconv
}
