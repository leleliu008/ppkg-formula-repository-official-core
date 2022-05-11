pkg_set summary "GNU binary tools for native development"
pkg_set webpage "https://www.gnu.org/software/binutils/binutils.html"
pkg_set src.url "https://ftp.gnu.org/gnu/binutils/binutils-2.35.tar.xz"
pkg_set src.sha "1b11659fb49e20e18db460d44485f09442c8c56d5df165de9461eb09c8302f85"
pkg_set license "GPL-2.0"
pkg_set bsystem "configure"
pkg_set dep.pkg "isl gmp libmpc mpfr"
pkg_set ldflags "-lm"

build() {
    configure \
        --with-isl="$isl_INSTALL_DIR" \
        --with-gmp="$gmp_INSTALL_DIR" \
        --with-mpc="$libmpc_INSTALL_DIR" \
        --with-mpfr="$mpfr_INSTALL_DIR" \
        --with-system-zlib \
        --disable-werror \
        --enable-interwork \
        --enable-multilib \
        --enable-targets=all
}
