pkg_set summary "Cross-shell prompt for astronauts"
pkg_set webpage "https://starship.rs"
pkg_set git.url "https://github.com/starship/starship.git"
pkg_set src.url "https://github.com/starship/starship/archive/v0.50.0.tar.gz"
pkg_set src.sha "d8f4dc9bd266f2a5c34926d361c62fdddb61cd7da4acadba5f9c175eb07602e5"
pkg_set license "ISC"
pkg_set bsystem "cargo"

build() {
    run cargo clean &&
    run cargo install -vv -j 1 --path "$PACKAGE_BSCRIPT_DIR" --root="$PACKAGE_INSTALL_DIR" 
}
