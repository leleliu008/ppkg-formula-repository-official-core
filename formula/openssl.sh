pkg_set summary "Cryptography and SSL/TLS Toolkit"
pkg_set webpage "https://openssl.org"
pkg_set git.url "https://github.com/openssl/openssl.git"
pkg_set src.url "https://www.openssl.org/source/openssl-1.1.1n.tar.gz"
pkg_set src.sha "40dceb51a4f6a5275bde0e6bf20ef4b91bfc32ed57c0552e2e8e15463372b17a"
pkg_set license "OpenSSL"
#pkg_set depends "perl:build"
pkg_set bsystem "make"
pkg_set binbstd 'yes'
#pkg_set ldflags "-Wl,-z,muldefs"

#注意：1.0.2以上的openssl不支持openssl-fips，从openssl3.0开始支持新设计的openssl-fips
#https://github.com/openssl/openssl/issues/7582
build() {
    run ./config \
        shared \
        no-ssl2 \
        no-ssl3 \
        no-comp \
        no-hw \
        no-engine \
        no-asm \
        --prefix="$PACKAGE_INSTALL_DIR" &&
    makew clean &&
    makew &&
    makew install
}
