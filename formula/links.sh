pkg_set summary "Lynx-like WWW browser that supports tables, menus, etc."
pkg_set webpage "http://links.twibright.com"
pkg_set src.url "http://links.twibright.com/download/links-2.21.tar.bz2"
pkg_set src.sha "285eed8591c7781ec26213df82786665aaa1b9286782e8a7a1a7e2a6e1630d63"
pkg_set license "GPL-2.0"
pkg_set depends "xz bzip2 libtiff libjpeg-turbo openssl"
pkg_set bsystem "gmake"
pkg_set binbstd "yes"

build() {
    # configure [options] [host]
    run ./configure \
        --prefix="$PACKAGE_INSTALL_DIR" \
        --enable-ipv6 \
        --enable-utf8 \
        --disable-graphics \
        --without-x \
        --with-zlib \
        --with-lzma \
        --with-bzip2 \
        --with-libtiff \
        --with-libjpeg \
        --with-ssl="$openssl_INSTALL_DIR" &&
    gmakew clean &&
    gmakew &&
    gmakew install &&
    gmakew distclean
}
