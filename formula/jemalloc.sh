package set summary "Implementation of malloc emphasizing fragmentation avoidance"
package set webpage "http://jemalloc.net"
package set src.url "https://github.com/jemalloc/jemalloc/releases/download/5.2.1/jemalloc-5.2.1.tar.bz2"
package set src.sum "34330e5ce276099e2e8950d9335db5a875689a4c6a56751ef3b1d8c537f887f6"
package set license "BSD-2-Clause"
package set bsystem 'configure'
package set binsrcd 'true'

build() {
    configure \
        --disable-debug \
        --disable-prof \
        --enable-libdl \
        --enable-log \
        --enable-cxx
}
