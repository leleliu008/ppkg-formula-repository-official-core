pkg_set summary "Terminal multiplexer"
pkg_set webpage "https://tmux.github.io"
pkg_set src.url "https://github.com/tmux/tmux/releases/download/3.1c/tmux-3.1c.tar.gz"
pkg_set src.sha "918f7220447bef33a1902d4faff05317afd9db4ae1c9971bef5c787ac6c88386"
pkg_set license "ISC"
pkg_set dep.pkg "ncurses libevent utf8proc"
pkg_set bsystem "configure"

build() {
    configure --enable-utf8proc
}
