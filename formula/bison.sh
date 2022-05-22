pkg_set summary "Yacc-compatible Parser generator"
pkg_set webpage "https://www.gnu.org/software/bison"
pkg_set src.url "https://ftp.gnu.org/gnu/bison/bison-3.8.2.tar.xz"
pkg_set src.sha "9bba0214ccf7f1079c5d59210045227bcf619519840ebfa80cd3849cff5a5bf2"
pkg_set git.url "https://git.savannah.gnu.org/git/bison.git"
pkg_set license "GPL-3.0-or-later"
pkg_set depends "m4"
pkg_set bsystem "configure"

build() {
    configure \
        --enable-yacc \
        --enable-relocatable \
        --enable-threads=posix \
        --disable-gcc-warnings \
        --disable-assert
}
