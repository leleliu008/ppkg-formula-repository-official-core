package set summary "HTTP(S) server and reverse proxy, and IMAP/POP3 proxy server"
package set webpage "https://nginx.org"
package set src.url "https://nginx.org/download/nginx-1.19.1.tar.gz"
package set src.sum "a004776c64ed3c5c7bc9b6116ba99efab3265e6b81d49a57ca4471ff90655492"
package set dep.pkg "openssl pcre libcrypt"
package set bsystem "make"
package set binsrcd 'YES'

build() {
    run ./configure \
        --prefix="$PACKAGE_INSTALL_DIR" \
        --with-pcre &&
    makew install
}
