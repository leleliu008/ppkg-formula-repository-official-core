package set summary "Netlink Library based Linux kernel interfaces"
package set src.git "https://github.com/thom311/libnl.git"
package set src.url "https://github.com/thom311/libnl/releases/download/libnl3_5_0/libnl-3.5.0.tar.gz"
package set src.sum "352133ec9545da76f77e70ccb48c9d7e5324d67f6474744647a7ed382b5e05fa"
package set bsystem "autotools"
package set dep.cmd "bison"

build() {
    configure \
        --enable-pthreads \
        --enable-cli
}
