pkg_set summary "TIFF library and utilities"
pkg_set webpage "https://libtiff.gitlab.io/libtiff"
pkg_set git.url "https://gitlab.com/libtiff/libtiff.git"
pkg_set src.url "https://download.osgeo.org/libtiff/tiff-4.3.0.tar.gz"
pkg_set src.sha "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"
pkg_set dep.pkg "zlib zstd xz"
pkg_set bsystem "cmake"

build() {
    cmakew \
    -Dzlib=ON \
    -Dzstd=ON \
    -Dlzma=ON \
    -Dlzw=ON \
    -Dwebp=OFF \
    -Djpeg=OFF \
    -DZLIB_INCLUDE_DIR="$zlib_INCLUDE_DIR" \
    -DZLIB_LIBRARY_RELEASE="$zlib_LIBRARY_DIR/libz.a" \
    -DZSTD_INCLUDE_DIR="$zstd_INCLUDE_DIR" \
    -DZSTD_LIBRARY="$zstd_LIBRARY_DIR/libzstd.a" \
    -DLIBLZMA_INCLUDE_DIR="$xz_INCLUDE_DIR" \
    -DLIBLZMA_LIBRARY_RELEASE="$xz_LIBRARY_DIR/liblzma.a"
}
