pkg_set summary "Multi-platform support library with a focus on asynchronous I/O"
pkg_set webpage "https://libuv.org"
pkg_set src.url "https://github.com/libuv/libuv/archive/v1.40.0.tar.gz"
pkg_set src.sha "70fe1c9ba4f2c509e8166c0ca2351000237da573bb6c82092339207a9715ba6b"
pkg_set license "MIT"
pkg_set bsystem "cmake"

build() {
    cmakew \
        -DLIBUV_BUILD_TESTS=OFF \
        -DLIBUV_BUILD_BENCH=OFF \
        -DQEMU=OFF &&
    mv "$PACKAGE_LIBRARY_DIR/libuv_a.a" "$PACKAGE_LIBRARY_DIR/libuv.a"
}
