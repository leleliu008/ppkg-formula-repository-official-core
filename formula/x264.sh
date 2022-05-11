pkg_set summary "H.264/AVC encoder"
pkg_set webpage "https://www.videolan.org/developers/x264.html"
pkg_set version "20191217-2245"
pkg_set src.url "http://ftp.videolan.org/pub/x264/snapshots/x264-snapshot-${PACKAGE_VERSION}.tar.bz2"
pkg_set src.sha "0bb67d095513391e637b3b47e8efc3ba4603c3844f1b4c2690f4d36da7763055"
pkg_set bsystem "configure"

build() {
    configure \
        --disable-asm \
        --disable-cli \
        --enable-pic \
        --enable-lto \
        --enable-strip
}
