pkg_set summary "C string library for manipulating Unicode strings"
pkg_set webpage "https://www.gnu.org/software/libunistring"
pkg_set src.url "https://ftp.gnu.org/gnu/libunistring/libunistring-0.9.10.tar.xz"
pkg_set src.sha "eb8fb2c3e4b6e2d336608377050892b54c3c983b646c561836550863003c05d7"
pkg_set dep.pkg "libiconv"
pkg_set bsystem "configure"

build() {
    configure \
        --with-libiconv-prefix="$libiconv_INSTALL_DIR" \
        --enable-threads=posix \
        --enable-relocatable \
        --enable-namespacing
}
