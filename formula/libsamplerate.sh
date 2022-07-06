pkg_set summary "Library for sample rate conpackage set version of audio data"
pkg_set webpage "http://www.mega-nerd.com/SRC"
pkg_set src.url "http://www.mega-nerd.com/SRC/libsamplerate-0.1.9.tar.gz"
pkg_set src.sha "0a7eb168e2f21353fb6d84da152e4512126f7dc48ccb0be80578c565413444c1"
pkg_set dep.pkg "libsndfile fftw"
pkg_set bsystem "autogen"
pkg_set ldflags "-logg -lm -lvorbis -lvorbisenc -lFLAC -lsqlite3"

prepare() {
    autoreconf -ivf &&
    sed_in_place '$d' autogen.sh &&
    ./autogen.sh
}

build() {
    export CFLAGS="$CFLAGS $LDFLAGS"
    configure
}
