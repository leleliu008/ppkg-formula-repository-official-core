pkg_set summary "Remote terminal application"
pkg_set webpage "https://mosh.org"
pkg_set git.url "https://github.com/mobile-shell/mosh.git"
pkg_set src.url "https://mosh.org/mosh-1.3.2.tar.gz"
pkg_set src.sha "da600573dfa827d88ce114e0fed30210689381bbdcff543c931e4d6a2e851216"
pkg_set license "GPL-3.0-or-later"
pkg_set depends "zlib openssl ncurses protobuf"
pkg_set bsystem "configure"

build() {
    configure --with-ncurses
}
