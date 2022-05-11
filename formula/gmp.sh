pkg_set summary "GNU multiple precision arithmetic library"
pkg_set webpage "https://gmplib.org"
pkg_set src.url "https://gmplib.org/download/gmp/gmp-6.2.0.tar.xz"
pkg_set src.sha "258e6cd51b3fbdfc185c716d55f82c08aff57df0c6fbd143cf6ed561267a1526"
pkg_set bsystem "configure"

build() {
    configure \
        --without-readline \
        --disable-profiling \
        --disable-assert \
        --disable-cxx \
        --enable-assembly \
        --enable-fft
}
