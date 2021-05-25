package set summary "Platform built on V8 to build network applications"
package set webpage "https://nodejs.org"
package set src.git "https://github.com/nodejs/node.git"
package set src.url "https://nodejs.org/dist/v15.8.0/node-v15.8.0.tar.xz"
package set src.sum "e23ae2f6181444066cf74e03c3e30e650fbc63764c2b89829928cddf3e4230a9"
package set license "MIT"
package set dep.cmd "makew pkg-config"

build() {
    "$SOURCE_DIR/configure" \
        --prefix="$PACKAGE_INSTALL_DIR" \
        --verbose &&
    makew -C "$SOURCE_DIR" &&
    makew -C "$SOURCE_DIR" install
}
