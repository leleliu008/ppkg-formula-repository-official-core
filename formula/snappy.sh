pkg_set summary "Compression/decompression library aiming for high speed"
pkg_set webpage "https://google.github.io/snappy"
pkg_set git.url "https://github.com/google/snappy.git"
pkg_set src.url "https://github.com/google/snappy/archive/1.1.8.tar.gz"
pkg_set src.sha "16b677f07832a612b0836178db7f374e414f94657c138e6993cbfc5dcc58651f"
pkg_set license "BSD-3-Clause"
pkg_set bsystem "cmake"

build() {
    cmakew \
        -DSNAPPY_BUILD_TESTS=OFF \
        -DSNAPPY_FUZZING_BUILD=OFF \
        -DSNAPPY_INSTALL=ON
}
