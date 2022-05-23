pkg_set summary "Compression and file packaging/archive utility"
pkg_set webpage "https://infozip.sourceforge.io/Zip.html"

pkg_set src.url "https://downloads.sourceforge.net/project/infozip/Zip%203.x%20%28latest%29/3.0/zip30.tar.gz"
pkg_set src.sha "f0e8bb1f9b7eb0b01285495a2699df3a4b766784c1765a8f1aeedf63c0806369"

# https://packages.debian.org/sid/zip
pkg_set fix.url "https://deb.debian.org/debian/pool/main/z/zip/zip_3.0-11.debian.tar.xz"
pkg_set fix.sha "c5c0714a88592f9e02146bfe4a8d26cd9bd97e8d33b1efc8b37784997caa40ed"

pkg_set version "3.0.11"

pkg_set license "Info-ZIP"
pkg_set bsystem "gmake"
pkg_set binbstd "yes"

prepare() {
    for patchfile in $(cat ../fix/patches/series)
    do  
        patch -p1 < ../fix/patches/$patchfile || return 1
    done
}

build() {
    gmakew -f unix/Makefile clean &&
    gmakew -f unix/Makefile generic \
        CC="$CC" \
        CPP="'$CPP'" \
        AS="$AS" \
        AR="$AR" \
        CFLAGS="'$CFLAGS $CPPFLAGS $LDFLAGS'" &&
    gmakew -f unix/Makefile install \
        prefix="$PACKAGE_INSTALL_DIR" \
        MANDIR="$PACKAGE_INSTALL_DIR/share/man/man1"
}
