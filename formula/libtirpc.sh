pkg_set summary "Port of Sun's Transport-Independent RPC library to Linux"
pkg_set webpage "https://sourceforge.net/projects/libtirpc"
pkg_set src.url "https://nchc.dl.sourceforge.net/project/libtirpc/libtirpc/1.2.6/libtirpc-1.2.6.tar.bz2"
pkg_set src.sha "4278e9a5181d5af9cd7885322fdecebc444f9a3da87c526e7d47f7a12a37d1cc"
pkg_set bsystem "configure"

build() {
    configure \
        --disable-gssapi \
        --enable-ipv6 \
        --enable-symvers \
        --enable-authdes
}
