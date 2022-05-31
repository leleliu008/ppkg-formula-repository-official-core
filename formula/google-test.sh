pkg_set summary "C++ Testing and Mocking Framework by Google"
pkg_set git.url "https://github.com/google/googletest.git"
pkg_set src.url "https://github.com/google/googletest/archive/release-1.10.0.tar.gz"
pkg_set src.sha "9dc9157a9a1551ec7a7e43daea9a694a0bb5fb8bec81235d8a1e6ef64c716dcb"
pkg_set license "BSD-3-Clause"
pkg_set bsystem "cmake"

build() {
    cmakew \
        -DBUILD_GMOCK=ON \
        -DINSTALL_GTEST=ON
}
