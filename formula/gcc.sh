pkg_set summary "GNU compiler collection"
pkg_set webpage "https://gcc.gnu.org/"
pkg_set git.url "https://gcc.gnu.org/git/gcc.git"
pkg_set src.url "https://ftp.gnu.org/gnu/gcc/gcc-11.3.0/gcc-11.3.0.tar.xz"
pkg_set src.sha "b47cf2818691f5b1e21df2bb38c795fac2cfbd640ede2d0a5e1c89e338a3ac39"
pkg_set license "GPL-3.0-or-later"
pkg_set depends "isl libmpc zlib"
pkg_set bsystem "configure"

prepare() {
    sed_in_place 's|sub/conftest.c|sub/conftest.cc|g'    gcc/configure
    sed_in_place 's|sub/conftest.c|sub/conftest.cc|g' libcpp/configure
}

build() {
    configure \
        --with-isl=$isl_INSTALL_DIR \
        --with-gmp=$gmp_INSTALL_DIR \
        --with-mpc=$libmpc_INSTALL_DIR \
        --with-mpfr=$mpfr_INSTALL_DIR \
        --with-system-zlib \
        --enable-languages=c++ \
        --disable-multilib
}
