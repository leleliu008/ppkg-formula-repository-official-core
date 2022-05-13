pkg_set summary "GNU awk utility"
pkg_set webpage "https://www.gnu.org/software/gawk"
pkg_set src.url "https://ftp.gnu.org/gnu/gawk/gawk-5.1.0.tar.xz"
pkg_set src.sha "cf5fea4ac5665fd5171af4716baab2effc76306a9572988d5ba1078f196382bd"
pkg_set license "GPL-3.0"
pkg_set depends "readline mpfr"
pkg_set bsystem "configure"

build() {
    configure \
        --with-readline="$readline_INSTALL_DIR" \
        --with-mpfr="$mpfr_INSTALL_DIR" \
        --enable-extensions \
        --enable-lint \
        --enable-mpfr \
        --disable-builtin-intdiv0
}
