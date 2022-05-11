pkg_set summary "GNOME XML library"
pkg_set webpage "http://xmlsoft.org"
pkg_set src.url "ftp://xmlsoft.org/libxml2/libxml2-2.9.10.tar.gz"
pkg_set src.sha "aafee193ffb8fe0c82d4afef6ef91972cbaf5feea100edc2f262750611b4be1f"
pkg_set bsystem "configure"
pkg_set dep.pkg "libiconv zlib"

build() {
    configure \
        --with-iconv="$libiconv_INSTALL_DIR" \
        --with-zlib \
        --without-lzma \
        --without-python \
        --without-readline \
        --without-debug \
        --without-coverage \
        --enable-ipv6
}
