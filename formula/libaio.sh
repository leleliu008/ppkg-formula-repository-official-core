pkg_set summary "Linux-native asynchronous I/O access library"
pkg_set webpage "https://pagure.io/libaio"
pkg_set src.url "https://pagure.io/libaio/archive/libaio-0.3.112/libaio-libaio-0.3.112.tar.gz"
pkg_set src.sha "b7cf93b29bbfb354213a0e8c0e82dfcf4e776157940d894750528714a0af2272"
pkg_set license "LGPL-2.1-or-later"
pkg_set bsystem "gmake"

prepare() {
    # on macOS, some fs is non-case-sensitive. In this case,gmakew install will always say make: 'install' is up to date.
    mv INSTALL INSTALL.txt &&
    sed_in_place 's|install -D|install|g' src/Makefile
}

build() {
    install -d "$PACKAGE_INSTALL_DIR/include" &&
    install -d "$PACKAGE_INSTALL_DIR/lib" &&
    gmakew -C "$PACKAGE_INSTALLING_BST_DIR" clean &&
    gmakew -C "$PACKAGE_INSTALLING_BST_DIR" default CFLAGS="'$CFLAGS $CPPFLAGS $LDFLAGS -I$SOURCE_DIR/src'" AR="$AR" RANLIB="$RANLIB" &&
    gmakew -C "$PACKAGE_INSTALLING_BST_DIR" install prefix="$PACKAGE_INSTALL_DIR"
}
