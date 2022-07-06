pkg_set summary "Netlink Library based Linux kernel interfaces"
pkg_set git.url "https://github.com/thom311/libnl.git"
pkg_set src.url "https://github.com/thom311/libnl/releases/download/libnl3_5_0/libnl-3.5.0.tar.gz"
pkg_set src.sha "352133ec9545da76f77e70ccb48c9d7e5324d67f6474744647a7ed382b5e05fa"
pkg_set dep.pkg "bison"
pkg_set bsystem "autotools"

build() {
    configure \
        --enable-pthreads \
        --enable-cli
}
