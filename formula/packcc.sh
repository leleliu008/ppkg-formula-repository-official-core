pkg_set summary "a packrat parser generator for C"
pkg_set git.url "https://github.com/enechaev/packcc.git"

build() {
    run $CC $CPPFLAGS $CFLAGS $LDFLAGS -o packcc $PACKAGE_BSCRIPT_DIR/packcc.c &&
    install_bins packcc
}
