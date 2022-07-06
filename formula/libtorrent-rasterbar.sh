pkg_set summary "an efficient feature complete C++ bittorrent implementation focusing on efficiency and scalability."
pkg_set webpage "http://libtorrent.org"
pkg_set git.url "https://github.com/arvidn/libtorrent.git"
pkg_set src.url "https://github.com/arvidn/libtorrent/releases/download/v2.0.3/libtorrent-rasterbar-2.0.3.tar.gz"
pkg_set src.sha "59bfc7654bccaa2735353fb21e503ed6f66f1964150b70799150ed3f2403bcc5"
pkg_set bsystem "cmake"
pkg_set dep.pkg "openssl boost"

build() {
    cmakew \
        -Dstatic_runtime=ON \
        -Dencryption=ON \
        -Dbuild_tools=ON \
        -Dbuild_tests=OFF \
        -Dbuild_examples=OFF \
        -Dpython-bindings=OFF \
        -DBoost_INCLUDE_DIR="$boost_INCLUDE_DIR"
}
