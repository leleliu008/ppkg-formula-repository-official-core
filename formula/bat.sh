pkg_set summary "Clone of cat(1) with syntax highlighting and Git integration"
pkg_set git.url "https://github.com/sharkdp/bat.git"
pkg_set src.url "https://github.com/sharkdp/bat/archive/v0.17.1.tar.gz"
pkg_set src.sha "16d39414e8a3b80d890cfdbca6c0e6ff280058397f4a3066c37e0998985d87c4"
pkg_set license "Apache-2.0"
pkg_set bsystem "cargo"

build() {
    run cargo clean &&
    run cargo install -vv --path "$PACKAGE_BSCRIPT_DIR" --root="$PACKAGE_INSTALL_DIR" &&
    install_mans $(find "$PACKAGE_BSCRIPT_DIR/target/$CARGO_TARGET/release/build" -name 'bat.1') 
}
