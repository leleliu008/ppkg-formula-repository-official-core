pkg_set summary "Convert pixel information into colored ASCII art"
pkg_set webpage "http://caca.zoy.org/wiki/libcaca"
pkg_set git.url "https://github.com/cacalabs/libcaca.git"
pkg_set src.url "https://fossies.org/linux/privat/libcaca-0.99.beta19.tar.gz"
pkg_set src.sha "128b467c4ed03264c187405172a4e83049342cc8cc2f655f53a2d0ee9d3772f4"
pkg_set license "WTFPL"
pkg_set bsystem "configure"
pkg_set dep.cmd "pkg-config"
pkg_set dep.pkg "imlib2"
pkg_set cdefine "X_DISPLAY_MISSING"
pkg_set ldflags "-lbz2 -lz -lm -lbrotlidec -lbrotlicommon -lpng -lfreetype"

build() {
    if [ "$TARGET_OS_ARCH" = 'x86_64' ] ; then
        sed_in_place '/HAVE_FLDLN2/d' "$PACKAGE_BSCRIPT_DIR/configure" || return 1
    fi

    configure \
        --disable-csharp \
        --disable-python \
        --disable-slang \
        --disable-java \
        --disable-ruby \
        --disable-x11 \
        --disable-doc
}
