package set summary "Common error values for all GnuPG components"
package set webpage "https://www.gnupg.org/related_software/libgpg-error"
package set src.url "https://gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.37.tar.bz2"
package set src.sum "b32d6ff72a73cf79797f7f2d039e95e9c6f92f0c1450215410840ab62aea9763"
package set license "LGPL-2.1-or-later"
package set bsystem "configure"

build() {
    configure \
        --disable-build-timestamp \
        --disable-languages \
        --disable-werror \
        --disable-tests \
        --enable-doc \
        --enable-threads=posix
}
