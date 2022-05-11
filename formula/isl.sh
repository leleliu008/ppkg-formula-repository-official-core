pkg_set summary "Integer Set Library for the polyhedral model"
pkg_set webpage "https://isl.gforge.inria.fr"
pkg_set src.url "http://isl.gforge.inria.fr/isl-0.22.1.tar.xz"
pkg_set src.sha "28658ce0f0bdb95b51fd2eb15df24211c53284f6ca2ac5e897acc3169e55b60f"
pkg_set bsystem "configure"
pkg_set dep.pkg "gmp"
pkg_set ldflags "-lgmp"

build() {
    configure \
        --with-int=gmp \
        --with-gmp=system \
        --with-gmp-prefix="$gmp_INSTALL_DIR"
}
