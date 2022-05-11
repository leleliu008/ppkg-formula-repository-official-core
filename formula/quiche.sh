pkg_set summary "Savoury implementation of the QUIC transport protocol and HTTP/3"
pkg_set git.url "https://github.com/cloudflare/quiche.git"
pkg_set bsystem "cargo"
pkg_set binbstd 'YES'

build() {
    run cargo clean &&
    run cargo build --release -vv &&
    install_incs include/quiche.h &&
    install_libs target/$CARGO_TARGET/release/libquiche.a &&
    install_libs target/$CARGO_TARGET/release/libquiche.so
}
