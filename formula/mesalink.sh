pkg_set summary "memory-safe and OpenSSL-compatible TLS library"
pkg_set webpage "https://mesalink.io"
pkg_set git.url "https://github.com/mesalock-linux/mesalink.git"
pkg_set bsystem "cargo"
pkg_set binbstd 'YES'

build() {
    run cargo clean &&
    run cargo build --release -vv &&
    run install_incs mesalink/*.h &&
    run install_incs mesalink/openssl/*.h:openssl &&
    run install_libs target/$CARGO_TARGET/release/libmesalink.a &&
    run install_libs target/$CARGO_TARGET/release/libmesalink.so
}
