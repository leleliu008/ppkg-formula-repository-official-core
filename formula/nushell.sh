pkg_set summary "Modern shell for the GitHub era"
pkg_set webpage "https://www.nushell.sh"
pkg_set git.url "https://github.com/nushell/nushell.git"
pkg_set src.url "https://github.com/nushell/nushell/archive/0.26.0.tar.gz"
pkg_set src.sha "66fbfe1297997a3f6b2181cd723816150ad2453527c7cab6c83a9c67b9af2478"
pkg_set license "MIT"
pkg_set dep.cmd "pkg-config"
pkg_set dep.pkg "zlib openssl"
pkg_set bsystem "cargo"
pkg_set binbstd 'YES'

build() {
    run cargo clean &&
    run cargo install -vv --path "$PACKAGE_BSCRIPT_DIR" --root="$PACKAGE_INSTALL_DIR"
}
