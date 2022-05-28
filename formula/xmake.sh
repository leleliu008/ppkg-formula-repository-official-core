pkg_set summary "Cross-platform build utility based on Lua"
pkg_set webpage "https://xmake.io/"
pkg_set git.url "https://github.com/xmake-io/xmake.git"
pkg_set src.url "https://github.com/xmake-io/xmake/releases/download/v2.6.6/xmake-v2.6.6.tar.gz"
pkg_set src.sha "02267dc2af26088275661c4c6d986af0cdc283ff7684910bee3d8ab45c30389d"
pkg_set license "Apache-2.0"
pkg_set bsystem "gmake"
pkg_set binbstd "yes"

build() {
    gmakew clean
    gmakew
    gmakew install prefix="$PACKAGE_INSTALL_DIR"
}
