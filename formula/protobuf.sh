pkg_set summary "data interchange format by Google"
pkg_set git.url "https://github.com/protocolbuffers/protobuf.git"
pkg_set src.url "https://github.com/protocolbuffers/protobuf/releases/download/v3.13.0/protobuf-all-3.13.0.tar.gz"
pkg_set src.sha "465fd9367992a9b9c4fba34a549773735da200903678b81b25f367982e8df376"
pkg_set license "BSD-3-Clause"
pkg_set dep.pkg "zlib"
pkg_set bscript "cmake"
pkg_set bsystem "cmake"

build() {
    cmakew \
        -Dprotobuf_BUILD_TESTS=OFF \
        -Dprotobuf_BUILD_EXAMPLES=OFF \
        -DZLIB_INCLUDE_DIR="$zlib_INCLUDE_DIR" \
        -DZLIB_LIBRARY_RELEASE="$zlib_LIBRARY_DIR/libz.a"
}
