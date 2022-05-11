pkg_set summary "Converts a ttyrec file into gif files"
pkg_set git.url "https://github.com/icholy/ttygif.git"
pkg_set src.url "https://github.com/icholy/ttygif/archive/1.5.0.tar.gz"
pkg_set src.sha "b5cc9108b1add88c6175e3e001ad4615a628f93f2fffcb7da9e85a9ec7f23ef6"
pkg_set license "MIT"
pkg_set bsystem "make"
pkg_set binbstd 'YES'

prepare() {
    sed_in_place 's|CFLAGS += -O2 -Wall|override CFLAGS +=|' Makefile
}

build() {
    makew clean
    makew CC=$CC CFLAGS="'$CFLAGS $CPPFLAGS $LDFLAGS'"
    makew install PREFIX="$PACKAGE_INSTALL_DIR"
}
