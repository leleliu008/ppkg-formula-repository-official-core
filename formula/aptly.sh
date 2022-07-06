pkg_set summary "Swiss army knife for Debian repository management"
pkg_set webpage "https://www.aptly.info/"
pkg_set git.url "https://github.com/aptly-dev/aptly.git"
pkg_set src.url "https://github.com/aptly-dev/aptly/archive/v1.5.0.tar.gz"
pkg_set src.sha "07e18ce606feb8c86a1f79f7f5dd724079ac27196faa61a2cefa5b599bbb5bb1"
pkg_set license "MIT"
pkg_set bsystem "go"

build() {
    gow -X main.Version=$PACKAGE_VERSION &&
    run install_mans $PACKAGE_INSTALLING_BST_DIR/man/aptly.1
}
