pkg_set summary "Tool for building toolchains"
pkg_set webpage "https://crosstool-ng.github.io"
pkg_set src.url "http://crosstool-ng.org/download/crosstool-ng/crosstool-ng-1.24.0.tar.xz"
pkg_set src.sha "804ced838ea7fe3fac1e82f0061269de940c82b05d0de672e7d424af98f22d2d"
pkg_set license "LGPL-2.1"
pkg_set dep.cmd "libtoolize libtool help2man objcopy"
pkg_set dep.pkg "ncurses libiconv gettext"
pkg_set bsystem "configure"

build() {
    export LDFLAGS="$LDFLAGS $gettext_LIBRARY_DIR/libintl.so $libiconv_LIBRARY_DIR/libiconv.a"
    configure \
        --with-bash-completion \
        --with-ncurses \
        --with-libiconv-prefix="$libiconv_INSTALL_DIR" \
        --with-libintl-prefix="$gettext_INSTALL_DIR" \
        CURSES_LIBS="$ncurses_LIBRARY_DIR/libncurses.a" \
        PANEL_LIBS="$ncurses_LIBRARY_DIR/libpanel.a" \
        MENU_LIBS="$ncurses_LIBRARY_DIR/libmenu.a"
}
