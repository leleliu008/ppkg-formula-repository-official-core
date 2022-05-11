pkg_set summary "Text-based UI library"
pkg_set webpage "https://www.gnu.org/software/ncurses"
pkg_set src.url "https://ftp.gnu.org/gnu/ncurses/ncurses-6.2.tar.gz"
pkg_set src.sha "30306e0c76e0f9f1f0de987cf1c82a5c21e1ce6568b9227f7da5b71cbea86c9d"
pkg_set license "MIT"
pkg_set bsystem "configure"
pkg_set dep.cmd "sed grep"

build() {
    configure \
        --with-pkg-config-libdir="$PACKAGE_PKGCONF_DIR" \
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
    cd "$PACKAGE_INCLUDE_DIR" || return 1
    for item in curses.h ncurses.h form.h menu.h panel.h term.h termcap.h
    do
        ln -s "ncursesw/$item" "$item" || return 1
    done
    
    cd "$PACKAGE_LIBRARY_DIR" || return 1
    for item in libncurses libpanel libmenu libform
    do
        ln -s "${item}w$STATIC_LIBRARY_EXT" "${item}$STATIC_LIBRARY_EXT" || return 1
        ln -s "${item}w$SHARED_LIBRARY_EXT" "${item}$SHARED_LIBRARY_EXT" || return 1
    done
    ln -s libncurses++w.a libncurses++.a || return 1

    cd "$PACKAGE_PKGCONF_DIR" &&
    ln -s ncursesw.pc ncurses.pc
}
