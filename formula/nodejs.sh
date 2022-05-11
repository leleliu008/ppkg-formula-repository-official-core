pkg_set summary "Platform built on V8 to build network applications"
pkg_set webpage "https://nodejs.org"
pkg_set git.url "https://github.com/nodejs/node.git"
pkg_set src.url "https://nodejs.org/dist/v15.8.0/node-v15.8.0.tar.xz"
pkg_set src.sha "e23ae2f6181444066cf74e03c3e30e650fbc63764c2b89829928cddf3e4230a9"
pkg_set license "MIT"
pkg_set dep.cmd "makew pkg-config"

build() {
    "$PACKAGE_BSCRIPT_DIR/configure" \
        --prefix="$PACKAGE_INSTALL_DIR" \
        --verbose &&
    makew -C "$PACKAGE_BSCRIPT_DIR" &&
    makew -C "$PACKAGE_BSCRIPT_DIR" install
}
