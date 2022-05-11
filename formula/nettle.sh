pkg_set summary "Low-level cryptographic library"
pkg_set webpage "https://www.lysator.liu.se/~nisse/nettle"
pkg_set src.url "https://ftp.gnu.org/gnu/nettle/nettle-3.6.tar.gz"
pkg_set src.sha "d24c0d0f2abffbc8f4f34dcf114b0f131ec3774895f3555922fe2f40f3d5e3f1"
pkg_set license "GPL-2.0-or-later"
pkg_set bsystem "configure"
pkg_set dep.pkg "gmp"

build() {
    configure \
        --with-include-path="$gmp_INCLUDE_DIR" \
        --with-lib-path="$gmp_LIBRARY_DIR" \
        --disable-fat \
        --disable-gcov \
        --disable-openssl \
        --disable-mini-gmp \
        --enable-assembler \
        --enable-documentation
}
