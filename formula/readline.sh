pkg_set summary "Library for command-line editing"
pkg_set webpage "https://www.gnu.org/software/readline"
pkg_set src.url "https://mirrors.tuna.tsinghua.edu.cn/gnu/readline/readline-8.0.tar.gz"
pkg_set src.sha "e339f51971478d369f8a053a330a190781acb9864cf4c541060f12078948e461"
pkg_set license "GPL-3.0-or-later"
pkg_set bsystem "configure"
pkg_set depends "ncurses"

build() {
    configure \
        --with-curses="$ncurses_INSTALL_DIR" \
        --enable-multibyte \
        --enable-install-examples
}
