package set summary "Port of Sun's Transport-Independent RPC library to Linux"
package set webpage "https://sourceforge.net/projects/libtirpc"
package set src.url "https://nchc.dl.sourceforge.net/project/libtirpc/libtirpc/1.2.6/libtirpc-1.2.6.tar.bz2"
package set src.sum "4278e9a5181d5af9cd7885322fdecebc444f9a3da87c526e7d47f7a12a37d1cc"
package set bsystem "configure"

build() {
    configure \
        --disable-gssapi \
        --enable-ipv6 \
        --enable-symvers \
        --enable-authdes
}
