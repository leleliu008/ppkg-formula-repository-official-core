pkg_set summary "Platform-neutral API for system-level and libc-like functions"
pkg_set webpage "https://developer.mozilla.org/docs/Mozilla/Projects/NSPR"
pkg_set src.url "https://archive.mozilla.org/pub/nspr/releases/v4.29/src/nspr-4.29.tar.gz"
pkg_set src.sha "22286bdb8059d74632cc7c2865c139e63953ecfb33bf4362ab58827e86e92582"
pkg_set license "MPL-2.0"
pkg_set bscript "nspr"
pkg_set bsystem "configure"

build() {
    configure \
        --enable-strip \
        --enable-ipv6 \
        --disable-cplus \
        --with-pthreads
}
