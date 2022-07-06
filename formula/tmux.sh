pkg_set summary "Terminal multiplexer"
pkg_set webpage "https://tmux.github.io"
pkg_set git.url "https://github.com/tmux/tmux.git"
pkg_set src.url "https://github.com/tmux/tmux/releases/download/3.3a/tmux-3.3a.tar.gz"
pkg_set src.sha "e4fd347843bd0772c4f48d6dde625b0b109b7a380ff15db21e97c11a4dcdf93f"
pkg_set license "ISC"
pkg_set dep.pkg "ncurses libevent utf8proc"
pkg_set bsystem "configure"

build() {
    configure --enable-utf8proc
}
