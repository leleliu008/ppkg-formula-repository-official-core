pkg_set summary "Asynchronous event library"
pkg_set webpage "https://libevent.org"
pkg_set version "2.1.12"
pkg_set src.url "https://github.com/libevent/libevent/releases/download/release-${PACKAGE_VERSION}-stable/libevent-${PACKAGE_VERSION}-stable.tar.gz"
pkg_set src.sha "92e6de1be9ec176428fd2367677e61ceffc2ee1cb119035037a27d346b0403bb"
pkg_set depends "openssl"
pkg_set bsystem "cmake"

build() {
    cmakew \
        -DEVENT__DISABLE_DEBUG_MODE=ON \
        -DEVENT__DISABLE_TESTS=ON \
        -DEVENT__DISABLE_REGRESS=ON \
        -DEVENT__DISABLE_BENCHMARK=ON \
        -DEVENT__DISABLE_SAMPLES=ON \
        -DEVENT__DISABLE_OPENSSL=OFF \
        -DEVENT__DOXYGEN=OFF \
        -DEVENT__COVERAGE=OFF \
        -DEVENT__LIBRARY_TYPE=BOTH
}
