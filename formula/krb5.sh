package set summary "Network authentication protocol"
package set webpage "https://web.mit.edu/kerberos"
package set src.url "https://kerberos.org/dist/krb5/1.18/krb5-1.18.3.tar.gz"
package set src.sum "e61783c292b5efd9afb45c555a80dd267ac67eebabca42185362bee6c4fbd719"
package set sourced "src"
package set bsystem "configure"
package set dep.pkg "readline openssl berkeley-db"
package set ldflags "-lncurses"

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
