pkg_set summary "Hyperfast web frontend for Git repositories written in C"
pkg_set webpage "https://git.zx2c4.com/cgit"
pkg_set src.url "https://git.zx2c4.com/cgit/snapshot/cgit-1.2.3.tar.xz"
pkg_set src.sha "5a5f12d2f66bd3629c8bc103ec8ec2301b292e97155d30a9a61884ea414a6da4"
pkg_set license "GPL-2.0-only"
pkg_set depends "openssl gettext git"
pkg_set bsystem "gmake"
pkg_set binbstd "yes"

build() {
    gmakew clean &&
    gmakew &&
    gmakew install prefix="$PACKAGE_INSTALL_DIR"
}
