pkg_set summary "ASN.1 structure parser library"
pkg_set webpage "https://www.gnu.org/software/libtasn1"
pkg_set src.url "https://ftp.gnu.org/gnu/libtasn1/libtasn1-4.16.0.tar.gz"
pkg_set src.sha "0e0fb0903839117cb6e3b56e68222771bebf22ad7fc2295a0ed7d576e8d4329d"
pkg_set bsystem "configure"

build() {
    configure \
        --without-gcov \
        --disable-valgrind-tests \
        --disable-code-coverage \
        --disable-gtk-doc \
        --enable-gcc-warnings
}
