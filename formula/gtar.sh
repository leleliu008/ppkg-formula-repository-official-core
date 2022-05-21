pkg_set summary "GNU package set version of the tar archiving utility"
pkg_set webpage "https://www.gnu.org/software/tar"
pkg_set src.url "https://ftp.gnu.org/gnu/tar/tar-1.34.tar.gz"
pkg_set src.sha "03d908cf5768cfe6b7ad588c921c6ed21acabfb2b79b788d1330453507647aed"
pkg_set license "GPL-3.0-or-later"
pkg_set bsystem "configure"

build() {
    configure \
        --with-included-regex \
        --with-xattrs \
        --without-posix-acls \
        --without-selinux \
        --disable-acl \
        --disable-gcc-warnings
}
