pkg_set summary "HTTP(S) server and reverse proxy, and IMAP/POP3 proxy server"
pkg_set webpage "https://nginx.org"
pkg_set src.url "https://nginx.org/download/nginx-1.19.1.tar.gz"
pkg_set src.sha "a004776c64ed3c5c7bc9b6116ba99efab3265e6b81d49a57ca4471ff90655492"
pkg_set depends "openssl pcre libcrypt"
pkg_set bsystem "gmake"
pkg_set binbstd "yes"

build() {
    run ./configure \
        --prefix="$PACKAGE_INSTALL_DIR" \
        --with-pcre &&
    gmakew install
}
