package set summary "Secure hashing function"
package set webpage "https://blake2.net"
package set src.git "https://github.com/BLAKE2/libb2.git"
package set src.url "https://github.com/BLAKE2/libb2/releases/download/v0.98.1/libb2-0.98.1.tar.gz"
package set src.sum "53626fddce753c454a3fea581cbbc7fe9bbcf0bc70416d48fdbbf5d87ef6c72e"
package set license "CC0-1.0"
package set bsystem "configure"
package set dep.cmd "autoconf automake>=1.16.0"

build() {
    configure \
        --disable-openmp \
        --disable-fat \
        --enable-native
}
