pkg_set summary "Open video compression format"
pkg_set webpage "https://www.theora.org"
pkg_set src.url "https://downloads.xiph.org/releases/theora/libtheora-1.1.1.tar.bz2"
pkg_set src.sha "b6ae1ee2fa3d42ac489287d3ec34c5885730b1296f0801ae577a35193d3affbc"
pkg_set bsystem "autogen"
pkg_set depends "libogg libvorbis sdl2"

prepare() {
    sed_in_place '$d' autogen.sh && ./autogen.sh
}

build() {
    configure \
        --with-ogg="$libogg_INSTALL_DIR" \
        --with-vorbis="$libvorbis_INSTALL_DIR" \
        --with-sdl-prefix="$sdl2_INSTALL_DIR" \
        --disable-examples
}
