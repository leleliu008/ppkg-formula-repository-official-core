pkg_set summary "MP3 player"
pkg_set webpage "https://www.mpg123.de"
pkg_set src.url "https://www.mpg123.de/download/mpg123-1.26.3.tar.bz2"
pkg_set src.sha "30c998785a898f2846deefc4d17d6e4683a5a550b7eacf6ea506e30a7a736c6e"
pkg_set bsystem "configure"
pkg_set dep.cmd "pkg-config"
pkg_set dep.pkg "sdl2"

build() {
    configure \
        --enable-debug=no \
        --enable-ipv6=yes
}
