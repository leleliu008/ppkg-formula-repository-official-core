pkg_set summary "Secure runtime for JavaScript and TypeScript"
pkg_set webpage "https://deno.land"
pkg_set git.url "https://github.com/denoland/deno.git"
pkg_set version "1.8.0"
pkg_set src.url "https://github.com/denoland/deno/releases/download/v${PACKAGE_VERSION}/deno_src.tar.gz"
pkg_set src.sha "5cd695ef8f16e947d5155e53b159a147e538405310f892028fe5e2d21eddc3f9"
pkg_set license "MIT"
pkg_set bsystem "cargo"

build() {
    run cargo clean &&
    run cargo install -vv --locked --path "$PACKAGE_INSTALLING_BST_DIR/cli" --root="$PACKAGE_INSTALL_DIR"
}
