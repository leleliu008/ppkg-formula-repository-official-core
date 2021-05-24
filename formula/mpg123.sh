package set summary "MP3 player"
package set webpage "https://www.mpg123.de"
package set src.url "https://www.mpg123.de/download/mpg123-1.26.3.tar.bz2"
package set src.sum "30c998785a898f2846deefc4d17d6e4683a5a550b7eacf6ea506e30a7a736c6e"
package set bsystem "configure"
package set dep.cmd "pkg-config"
package set dep.pkg "sdl2"

build() {
    configure \
        --enable-debug=no \
        --enable-ipv6=yes
}
