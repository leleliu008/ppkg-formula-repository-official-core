pkg_set summary "X.509 and CMS library"
pkg_set webpage "https://www.gnupg.org/related_software/libksba"
pkg_set src.url "https://gnupg.org/ftp/gcrypt/libksba/libksba-1.4.0.tar.bz2"
pkg_set src.sha "bfe6a8e91ff0f54d8a329514db406667000cb207238eded49b599761bfca41b6"
pkg_set license "GPL-2.0"
pkg_set bsystem "configure"
pkg_set dep.pkg "libgpg-error"

build() {
    configure \
        --with-libgpg-error-prefix="$libgpg_error_INSTALL_DIR" \
        --enable-optimization \
        --disable-valgrind-tests \
        --disable-gcov
}
