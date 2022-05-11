pkg_set summary "POSIX-compliant descendant of NetBSD's ash (the Almquist SHell)"
pkg_set webpage "http://gondor.apana.org.au/~herbert/dash"
pkg_set src.url "http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.11.2.tar.gz"
pkg_set src.sha "00fb7d68b7599cc41ab151051c06c01e9500540183d8aa72116cb9c742bd6d5f"
pkg_set license "BSD-3-Clause"
pkg_set bsystem "configure"
pkg_set dep.pkg "libedit"

build() {
    configure \
        --with-libedit="$libedit_INSTALL_DIR" \
        --enable-glob=no \
        --enable-test-workaround=no \
        --enable-fnmatch \
        --enable-lineno
}
