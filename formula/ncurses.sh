pkg_set summary "Text-based UI library"
pkg_set webpage "https://www.gnu.org/software/ncurses"
pkg_set src.url "https://ftp.gnu.org/gnu/ncurses/ncurses-6.3.tar.gz"
pkg_set src.sha "97fc51ac2b085d4cde31ef4d2c3122c21abc217e9090a43a30fc5ec21684e059"
pkg_set license "MIT"
pkg_set bsystem "configure"
pkg_set binbstd "yes"

build() {
    #sed_in_place '1a set -x' configure
    install -d "$PACKAGE_INSTALL_DIR/lib/pkgconfig"
    configure \
        --with-pkg-config-libdir="$PACKAGE_INSTALL_DIR/lib/pkgconfig" \
        --with-shared \
        --without-ada \
        --without-tests \
        --without-debug \
        --without-valgrind \
        --enable-const \
        --enable-widec \
        --enable-termcap \
        --enable-warnings \
        --enable-pc-files \
        --enable-ext-mouse \
        --enable-ext-colors \
        --disable-stripping \
        --disable-assertions \
        --disable-gnat-projects \
        --disable-echo &&
    install_links
}

install_links() {
    cd "$PACKAGE_INSTALL_DIR/include" || return 1
    for item in curses.h ncurses.h form.h menu.h panel.h term.h termcap.h
    do
        ln -s "ncursesw/$item" "$item" || return 1
    done
    
    cd "$PACKAGE_INSTALL_DIR/lib" || return 1
    for item in libncurses libpanel libmenu libform
    do
        ln -s "${item}w$STATIC_LIBRARY_EXT" "${item}$STATIC_LIBRARY_EXT" || return 1
        ln -s "${item}w$SHARED_LIBRARY_EXT" "${item}$SHARED_LIBRARY_EXT" || return 1
    done
    ln -s libncurses++w.a libncurses++.a || return 1

    cd "$PACKAGE_INSTALL_DIR/lib/pkgconfig" &&
    ln -s ncursesw.pc ncurses.pc
}
