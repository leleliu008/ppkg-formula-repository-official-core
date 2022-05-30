pkg_set summary "Port of Sun Transport-Independent RPC library to Linux"
pkg_set webpage "https://sourceforge.net/projects/libtirpc"
pkg_set git.url "https://src.fedoraproject.org/rpms/libtirpc.git"
pkg_set src.url "https://downloads.sourceforge.net/project/libtirpc/libtirpc/1.3.2/libtirpc-1.3.2.tar.bz2"
pkg_set src.sha "e24eb88b8ce7db3b7ca6eb80115dd1284abc5ec32a8deccfed2224fc2532b9fd"
pkg_set license "BSD-3-Clause"
pkg_set bsystem "configure"

prepare() {
    fetch 'https://raw.githubusercontent.com/libevent/libevent/master/compat/sys/queue.h' --output-path=$PWD/../inc/sys/queue.h
}

build() {
    configure \
        --enable-ipv6 \
        --enable-symvers \
        --enable-authdes \
        --disable-gssapi
}
