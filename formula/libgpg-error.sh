pkg_set summary "Common error values for all GnuPG components"
pkg_set webpage "https://www.gnupg.org/related_software/libgpg-error"
pkg_set src.url "https://gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.37.tar.bz2"
pkg_set src.sha "b32d6ff72a73cf79797f7f2d039e95e9c6f92f0c1450215410840ab62aea9763"
pkg_set license "LGPL-2.1-or-later"
pkg_set bsystem "configure"

build() {
    configure \
        --disable-build-timestamp \
        --disable-languages \
        --disable-werror \
        --disable-tests \
        --enable-doc \
        --enable-threads=posix
}
