pkg_set summary "Implementation of malloc emphasizing fragmentation avoidance"
pkg_set webpage "http://jemalloc.net"
pkg_set src.url "https://github.com/jemalloc/jemalloc/releases/download/5.2.1/jemalloc-5.2.1.tar.bz2"
pkg_set src.sha "34330e5ce276099e2e8950d9335db5a875689a4c6a56751ef3b1d8c537f887f6"
pkg_set license "BSD-2-Clause"
pkg_set bsystem 'configure'
pkg_set binbstd 'YES'

build() {
    configure \
        --disable-debug \
        --disable-prof \
        --enable-libdl \
        --enable-log \
        --enable-cxx
}
