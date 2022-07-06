pkg_set summary "Secure hashing function"
pkg_set webpage "https://blake2.net"
pkg_set git.url "https://github.com/BLAKE2/libb2.git"
pkg_set src.url "https://github.com/BLAKE2/libb2/releases/download/v0.98.1/libb2-0.98.1.tar.gz"
pkg_set src.sha "53626fddce753c454a3fea581cbbc7fe9bbcf0bc70416d48fdbbf5d87ef6c72e"
pkg_set license "CC0-1.0"
pkg_set dep.pkg "autoconf automake"
pkg_set bsystem "configure"

build() {
    configure \
        --disable-openmp \
        --disable-fat \
        --enable-native
}
