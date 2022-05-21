pkg_set summary "Image format providing lossless and lossy compression for web images"
pkg_set webpage "https://developers.google.com/speed/webp"
pkg_set src.url "http://downloads.webmproject.org/releases/webp/libwebp-1.1.0.tar.gz"
pkg_set src.sha "98a052268cc4d5ece27f76572a7f50293f439c17a98e67c4ea0c7ed6f50ef043"
pkg_set depends "libpng libtiff libjpeg-turbo giflib"
pkg_set ldflags "-llzma -lzstd"
pkg_set bsystem "cmake"

build() {
    cmakew \
        -DZLIB_INCLUDE_DIR="$zlib_INCLUDE_DIR" \
        -DZLIB_LIBRARY_RELEASE="$zlib_LIBRARY_DIR/libz.a" \
        -DPNG_PNG_INCLUDE_DIR="$libpng_INCLUDE_DIR" \
        -DPNG_LIBRARY="$libpng_LIBRARY_DIR/libpng.a" \
        -DJPEG_INCLUDE_DIR="$libjpeg_turbo_INCLUDE_DIR" \
        -DJPEG_LIBRARY="$libjpeg_turbo_LIBRARY_DIR/libjpeg.a"\
        -DTIFF_INCLUDE_DIR="$libtiff_INCLUDE_DIR" \
        -DTIFF_LIBRARY="$libtiff_LIBRARY_DIR/libtiff.a" \
        -DGIF_INCLUDE_DIR="$giflib_INCLUDE_DIR" \
        -DGIF_LIBRARY="$giflib_LIBRARY_DIR/libgif.a"
}
