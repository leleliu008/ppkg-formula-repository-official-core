pkg_set summary "Collection of GNU find, xargs, and locate"
pkg_set webpage "https://www.gnu.org/software/findutils"
pkg_set src.url "https://ftp.gnu.org/gnu/findutils/findutils-4.9.0.tar.xz"
pkg_set src.sha "a2bfb8c09d436770edc59f50fa483e785b161a3b7b9d547573cb08065fd462fe"
pkg_set license "GPL-3.0"
pkg_set bsystem "configure"

build() {
    configure \
        --without-selinux \
        --with-included-regex \
        --enable-threads=posix \
        --enable-leaf-optimisation \
        --enable-d_type-optimisation \
        --disable-assert
}
