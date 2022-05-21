pkg_set summary "Application-level logging library"
pkg_set git.url "https://github.com/google/glog.git"
pkg_set src.url "https://github.com/google/glog/archive/v0.4.0.tar.gz"
pkg_set src.sha "f28359aeba12f30d73d9e4711ef356dc842886968112162bc73002645139c39c"
pkg_set license "BSD-3-Clause"
pkg_set bsystem "cmake"
pkg_set depends "gflags"

build() {
    cmakew \
        -DWITH_TLS=ON \
        -DWITH_THREADS=ON \
        -DWITH_GFLAGS=ON \
        -Dgflags_DIR="$gflags_LIBRARY_DIR/cmake/gflags"
}
