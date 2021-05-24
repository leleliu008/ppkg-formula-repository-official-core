package set summary "Terminal multiplexer"
package set webpage "https://tmux.github.io"
package set src.url "https://github.com/tmux/tmux/releases/download/3.1c/tmux-3.1c.tar.gz"
package set src.sum "918f7220447bef33a1902d4faff05317afd9db4ae1c9971bef5c787ac6c88386"
package set license "ISC"
package set dep.pkg "ncurses libevent utf8proc"
package set bsystem "configure"

build() {
    configure --enable-utf8proc
}
