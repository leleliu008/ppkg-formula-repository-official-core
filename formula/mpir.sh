pkg_set summary "Multiple Precision Integers and Rationals (fork of GMP)"
pkg_set webpage "http://mpir.org"
pkg_set src.url "http://mpir.org/mpir-3.0.0.tar.bz2"
pkg_set src.sha "52f63459cf3f9478859de29e00357f004050ead70b45913f2c2269d9708675bb"
pkg_set license "GPL-3.0"
pkg_set dep.cmd "yasm"
pkg_set bsystem "configure"

build() {
    configure \
        --disable-profiling \
        --disable-assert \
        --disable-fat \
        --enable-cxx \
        --enable-fft \
        --enable-gmpcompat
}
