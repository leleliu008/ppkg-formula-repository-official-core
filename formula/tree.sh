pkg_set summary "Display directories as trees (with optional color/HTML output)"
pkg_set webpage "http://mama.indstate.edu/users/ice/tree"
pkg_set src.url "http://mama.indstate.edu/users/ice/tree/src/tree-2.0.2.tgz"
pkg_set src.sha "7d693a1d88d3c4e70a73e03b8dbbdc12c2945d482647494f2f5bd83a479eeeaf"
pkg_set license "GPL-2.0-or-later"
pkg_set bsystem "gmake"
pkg_set binbstd "yes"

build() {
    gmakew clean &&
    gmakew install \
        PREFIX="$PACKAGE_INSTALL_DIR" \
        MANDIR="$PACKAGE_INSTALL_DIR/share/man" \
        CC="$CC" \
        CFLAGS="'$CFLAGS $CPPFLAGS'" \
        LDFLAGS="'$LDFLAGS'"
}
