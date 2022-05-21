pkg_set summary "File comparison utilities"
pkg_set webpage "https://www.gnu.org/software/diffutils"
pkg_set src.url "https://ftp.gnu.org/gnu/diffutils/diffutils-3.7.tar.xz"
pkg_set src.sha "b3a7a6221c3dc916085f0d205abf6b8e1ba443d4dd965118da364a1dc1cb3a26"
pkg_set license "GPL-3.0-or-later"
pkg_set bsystem "configure"

build() {
    configure \
        --with-included-regex \
        --disable-gcc-warnings
}
