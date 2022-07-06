pkg_set summary "Network authentication protocol"
pkg_set webpage "https://web.mit.edu/kerberos"
pkg_set src.url "https://kerberos.org/dist/krb5/1.18/krb5-1.18.3.tar.gz"
pkg_set src.sha "e61783c292b5efd9afb45c555a80dd267ac67eebabca42185362bee6c4fbd719"
pkg_set bscript "src"
pkg_set bsystem "configure"
pkg_set dep.pkg "readline openssl berkeley-db"
pkg_set ldflags "-lncurses"

build() {
    configure \
        --disable-static \
        --enable-dns-for-realm \
        --without-system-verto \
        --with-readline \
        --with-netlib=-lc \
        --with-size-optimizations \
        --with-system-db
}
