package set summary "Cryptography and SSL/TLS Toolkit"
package set webpage "https://openssl.org"
package set src.url "https://www.openssl.org/source/openssl-fips-2.0.16.tar.gz"
package set src.sum "a3cd13d0521d22dd939063d3b4a0d4ce24494374b91408a05bdaca8b681c63d4"
package set bsystem "make"
package set dep.cmd "perl"
package set binsrcd 'YES'

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
