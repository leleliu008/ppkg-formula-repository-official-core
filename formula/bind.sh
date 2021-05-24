package set summary "Implementation of the DNS protocols"
package set webpage "https://www.isc.org/downloads/bind"
package set src.url "https://downloads.isc.org/isc/bind9/9.16.8/bind-9.16.8.tar.xz"
package set src.sum "9e9b9c563692be86ec41f670f6b70e26c14e72445c742d7b5eb4db7d2b5e8d31"
package set license "MPL-2.0"
package set bsystem "configure"
package set dep.cmd "base64 patch pkg-config"
package set dep.pkg "json-c libxml2 libidn2 libuv openssl zlib"

build() {
    configure \
        --disable-linux-caps \
        --without-python \
        --with-zlib \
        --with-json-c \
        --with-libxml2 \
        --with-libidn2=yes \
        --with-openssl="$openssl_INSTALL_DIR"
}
