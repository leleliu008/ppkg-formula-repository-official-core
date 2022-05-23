pkg_set summary "Cryptography and SSL/TLS Toolkit"
pkg_set webpage "https://openssl.org"
pkg_set git.url "https://github.com/openssl/openssl.git"
pkg_set src.url "https://www.openssl.org/source/openssl-1.1.1o.tar.gz"
pkg_set src.sha "9384a2b0570dd80358841464677115df785edb941c71211f75076d72fe6b438f"
pkg_set license "OpenSSL"
pkg_set depends "perl"
pkg_set bsystem "gmake"
pkg_set binbstd "yes"
pkg_set ldflags "-Wl,-z,muldefs"

#注意：1.0.2以上的openssl不支持openssl-fips，从openssl3.0开始支持新设计的openssl-fips
#https://github.com/openssl/openssl/issues/7582
build() {
    run ./config \
        no-shared \
        no-ssl2 \
        no-ssl3 \
        no-comp \
        no-hw \
        no-engine \
        no-asm \
        --prefix="$PACKAGE_INSTALL_DIR" &&
    gmakew clean &&
    gmakew &&
    gmakew install
}
