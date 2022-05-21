pkg_set summary "GNU Transport Layer Security (TLS) Library"
pkg_set webpage "https://gnutls.org"
pkg_set src.url "https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-3.6.14.tar.xz"
pkg_set src.sha "5630751adec7025b8ef955af4d141d00d252a985769f51b4059e5affa3d39d63"
pkg_set bsystem "configure"
pkg_set depends "gmp libunistring nettle libtasn1 libidn2 p11-kit"
pkg_set ldflags "-lgmp -liconv"

build() {
    configure \
        --without-gcov \
        --disable-valgrind-tests \
        --disable-code-coverage \
        --disable-gtk-doc \
        --disable-guile \
        --enable-gcc-warnings
}
