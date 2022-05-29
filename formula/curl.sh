pkg_set summary "Get a file from an HTTP, HTTPS or FTP server"
pkg_set webpage "https://curl.haxx.se"
pkg_set src.url "https://curl.haxx.se/download/curl-7.83.1.tar.bz2"
pkg_set src.sha "f539a36fb44a8260ec5d977e4e0dbdd2eee29ed90fcedaa9bc3c9f78a113bff0"
pkg_set git.url "https://github.com/curl/curl.git"
pkg_set depends "openssl zlib"
pkg_set bsystem "configure"

build() {
    configure \
        --enable-optimize \
        --enable-pthreads \
        --with-default-ssl-backend=openssl \
        --with-ssl="$openssl_INSTALL_DIR"
}
