pkg_set summary "Get a file from an HTTP, HTTPS or FTP server"
pkg_set webpage "https://curl.haxx.se"
pkg_set src.url "https://curl.haxx.se/download/curl-7.70.0.tar.xz"
pkg_set src.sha "032f43f2674008c761af19bf536374128c16241fb234699a55f9fb603fcfbae7"
pkg_set depends "pkg-config:build openssl zlib brotli libidn2"
pkg_set bsystem "configure"

build() {
    configure --enable-optimize --enable-pthreads
}
