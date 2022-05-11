pkg_set summary "High quality, portable, open source libm implementation"
pkg_set webpage "https://openlibm.org"
pkg_set git.url "https://github.com/JuliaMath/openlibm.git"
pkg_set src.url "https://github.com/JuliaMath/openlibm/archive/v0.7.3.tar.gz"
pkg_set src.sha "d3bcc4ef21c033a0cc408a30186bb3dbe21219e0c52d328ca70eb688cf867354"
pkg_set bsystem "make"

prepare() {
    sed_in_place 's|-mhard-float||g' Make.inc
}

build() {
    if [ "$TARGET_OS_ARCH" = 'x86_64' ] ; then
        LONG_DOUBLE_NOT_DOUBLE=1
    else
        LONG_DOUBLE_NOT_DOUBLE=0
    fi
    makew -C "$PACKAGE_BSCRIPT_DIR" clean &&
    makew -C "$PACKAGE_BSCRIPT_DIR" install \
        prefix="$PACKAGE_INSTALL_DIR" \
        CC="$CC" \
        CFLAGS="\"$CFLAGS\"" \
        CPPFLAGS="\"$CPPFLAGS\"" \
        LDFLAGS="\"$LDFLAGS\"" \
        AR="$AR" \
        OS=Linux \
        ARCH="$TARGET_OS_ARCH" \
        LONG_DOUBLE_NOT_DOUBLE="$LONG_DOUBLE_NOT_DOUBLE"
}
