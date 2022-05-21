pkg_set summary "C library for files containing sampled sound"
pkg_set webpage "http://www.mega-nerd.com/libsndfile"
pkg_set src.url "http://www.mega-nerd.com/libsndfile/files/libsndfile-1.0.28.tar.gz"
pkg_set src.sha "1ff33929f042fa333aed1e8923aa628c3ee9e1eb85512686c55092d1e5a9dfa9"
pkg_set bsystem "configure"
pkg_set depends "libogg libvorbis flac sqlite"

build() {
    configure \
        --disable-test-coverage \
        --disable-octave \
        --enable-sqlite \
        --enable-external-libs
}
