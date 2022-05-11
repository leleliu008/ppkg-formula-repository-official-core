pkg_set summary "Cryptography and SSL/TLS Toolkit"
pkg_set webpage "https://openssl.org"
pkg_set src.url "https://www.openssl.org/source/openssl-fips-2.0.16.tar.gz"
pkg_set src.sha "a3cd13d0521d22dd939063d3b4a0d4ce24494374b91408a05bdaca8b681c63d4"
pkg_set bsystem "make"
pkg_set dep.cmd "perl"
pkg_set binbstd 'YES'

build() {
    run perl config \
        shared \
        no-ssl2 \
        no-ssl3 \
        no-comp \
        no-hw \
        no-engine \
        no-asm \
        --prefix="$PACKAGE_INSTALL_DIR" &&
    makew clean &&
    makew install
}
