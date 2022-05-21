pkg_set summary "GNU File, Shell, and Text utilities"
pkg_set webpage "https://www.gnu.org/software/coreutils"
pkg_set git.url "https://github.com/coreutils/coreutils.git"
pkg_set src.url "https://ftp.gnu.org/gnu/coreutils/coreutils-9.1.tar.xz"
pkg_set src.sha "61a1f410d78ba7e7f37a5a4f50e6d1320aca33375484a3255eddf17a38580423"
pkg_set license "GPL-3.0-or-later"
pkg_set bsystem "configure"

build() {
    configure \
        --with-included-regex \
        --with-linux-crypto \
        --without-gmp \
        --without-openssl \
        --without-selinux \
        --disable-libcap \
        --disable-libsmack \
        --disable-assert \
        --disable-gcc-warnings \
        --disable-acl \
        --enable-xattr \
        --enable-threads=posix
}
