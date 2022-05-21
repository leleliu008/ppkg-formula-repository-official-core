pkg_set summary "Validating, recursive, caching DNS resolver"
pkg_set webpage "https://www.unbound.net"
pkg_set git.url "https://github.com/NLnetLabs/unbound.git"
pkg_set src.url "https://nlnetlabs.nl/downloads/unbound/unbound-1.13.1.tar.gz"
pkg_set src.sha "8504d97b8fc5bd897345c95d116e0ee0ddf8c8ff99590ab2b4bd13278c9f50b8"
pkg_set license "BSD-3-Clause"
pkg_set depends "openssl libmnl libevent expat nghttp2"
pkg_set bsystem "configure"

build() {
    configure \
        --disable-systemd \
        --disable-gost \
        --enable-flto \
        --enable-pie \
        --enable-event-api \
        --with-pthreads \
        --with-ssl="$openssl_INSTALL_DIR" \
        --with-libmnl="$libmnl_INSTALL_DIR" \
        --with-libevent="$libevent_INSTALL_DIR" \
        --with-libexpat="$expat_INSTALL_DIR" \
        --with-libnghttp2="$nghttp2_INSTALL_DIR" \
        ac_cv_prog_AR="$AR"
}
