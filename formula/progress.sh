pkg_set summary "Coreutils progress viewer"
pkg_set git.url "https://github.com/Xfennec/progress.git"
pkg_set src.url "https://github.com/Xfennec/progress/archive/v0.15.tar.gz"
pkg_set src.sha "1ed0ac65a912ef1aa605d524eaddaacae92079cf71182096a7c65cbc61687d1b"
pkg_set license "GPL-3.0-or-later"
pkg_set dep.pkg "ncurses"
pkg_set bsystem "gmake"
pkg_set binbstd "yes"

build() {
    gmakew clean &&
    gmakew CC="$CC" CFLAGS="'$CFLAGS $CPPFLAGS'" LDFLAGS="'$LDFLAGS'" &&
    gmakew install PREFIX="$PACKAGE_INSTALL_DIR"
}
