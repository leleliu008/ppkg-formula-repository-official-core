pkg_set summary "ISO9660+RR manipulation tool"
pkg_set webpage "https://www.gnu.org/software/xorriso"
pkg_set src.url "https://ftp.gnu.org/gnu/xorriso/xorriso-1.5.2.tar.gz"
pkg_set src.sha "3b69f5c93ae7c40c5bbe4a847fa3963f5efc9c565551622f77121c5792fc17e7"
pkg_set license "GPL-2.0-or-later"
pkg_set bsystem "configure"
pkg_set dep.pkg "libiconv"

build() {
    configure \
        --enable-libacl \
        --enable-xattr \
        --enable-zlib \
        --enable-libbz2 \
        --enable-libcdio \
        --enable-jtethreads
}
