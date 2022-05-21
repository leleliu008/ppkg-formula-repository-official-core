pkg_set summary "Fast static site generator in a single binary with everything built-in"
pkg_set webpage "https://www.getzola.org"
pkg_set git.url "https://github.com/getzola/zola.git"
pkg_set src.url "https://github.com/getzola/zola/archive/v0.13.0.tar.gz"
pkg_set src.sha "84c20cf5c851a465266c5cc343623752102c53929f6da31b2a4ce747a87c5c23"
pkg_set license "MIT"
pkg_set bsystem "cargo"

build() {
    run cargo clean &&
    run cargo install -vv --locked --path "$PACKAGE_INSTALLING_BST_DIR" --root="$PACKAGE_INSTALL_DIR"
}
