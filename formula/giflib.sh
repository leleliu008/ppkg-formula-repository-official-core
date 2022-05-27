pkg_set summary "Library and utilities for processing GIFs"
pkg_set webpage "https://giflib.sourceforge.io"
pkg_set git.url "https://git.code.sf.net/p/giflib/code.git"
pkg_set src.url "https://downloads.sourceforge.net/project/giflib/giflib-5.2.1.tar.gz"
pkg_set src.sha "31da5562f44c5f15d63340a09a4fd62b48c45620cd302f77a6d9acf0077879bd"
pkg_set bsystem "gmake"
pkg_set binbstd "yes"
pkg_set parallel "no"

prepare() {
    sed_in_place 's#$(MAKE) -C doc#@mkdir -p doc \&\& ([ -f doc/giflib.1 ] || touch doc/giflib.1)#' Makefile
}

build() {
    gmakew clean &&
    gmakew install PREFIX="$PACKAGE_INSTALL_DIR" CC="$CC" AR="$AR" CFLAGS="'$CFLAGS'"
}
