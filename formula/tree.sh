pkg_set summary "Display directories as trees (with optional color/HTML output)"
pkg_set webpage "http://mama.indstate.edu/users/ice/tree"
pkg_set src.url "https://deb.debian.org/debian/pool/main/t/tree/tree_1.8.0.orig.tar.gz"
pkg_set src.sha "715d5d4b434321ce74706d0dd067505bb60c5ea83b5f0b3655dae40aa6f9b7c2"
pkg_set license "GPL-2.0"
pkg_set bsystem "make"

build() {
    makew -C "$PACKAGE_BSCRIPT_DIR" clean &&
    makew -C "$PACKAGE_BSCRIPT_DIR" install \
        prefix="$PACKAGE_INSTALL_DIR" \
        CC="$CC" \
        CFLAGS="'$CFLAGS $CPPFLAGS'" \
        LDFLAGS="'$LDFLAGS'"
}
