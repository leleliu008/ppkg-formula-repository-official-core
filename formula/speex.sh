pkg_set summary "Audio codec designed for speech"
pkg_set webpage "https://speex.org"
pkg_set src.url "https://downloads.xiph.org/releases/speex/speex-1.2.0.tar.gz"
pkg_set src.sha "eaae8af0ac742dc7d542c9439ac72f1f385ce838392dc849cae4536af9210094"
pkg_set bsystem "configure"
pkg_set dep.pkg "libogg speexdsp"
pkg_set ldflags "-lm"

build() {
    configure \
        OGG_CFLAGS="-logg" \
        OGG_LIBS="-logg" \
        SPEEXDSP_CFLAGS="-lspeexdsp" \
        SPEEXDSP_LIBS="-lspeexdsp"
}
