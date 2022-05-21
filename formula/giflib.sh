pkg_set summary "Library and utilities for processing GIFs"
pkg_set webpage "https://giflib.sourceforge.io"
pkg_set src.url "https://downloads.sourceforge.net/project/giflib/giflib-5.2.1.tar.gz"
pkg_set src.sha "31da5562f44c5f15d63340a09a4fd62b48c45620cd302f77a6d9acf0077879bd"
pkg_set bsystem "gmake"

prepare() {
    sed_in_place 's#$(MAKE) -C doc#@mkdir -p doc \&\& ([ -f doc/giflib.1 ] || touch doc/giflib.1)#' Makefile
}

build() {
    gmakew -C "$PACKAGE_INSTALLING_BST_DIR" clean &&
    gmakew -C "$PACKAGE_INSTALLING_BST_DIR" install PREFIX="$PACKAGE_INSTALL_DIR" CC="$CC" AR="$AR" CFLAGS="'$CFLAGS'"
}
