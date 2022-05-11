pkg_set summary "C library includes YUV conpackage set version and scaling functionality"
pkg_set webpage "https://chromium.googlesource.com/external/libyuv"
pkg_set git.url "https://github.com/Bilibili/libyuv.git"
pkg_set bsystem "cmake"
pkg_set dep.pkg "libjpeg-turbo"
pkg_set cdefine "LIBYUV_DISABLE_NEON"

build() {
    cmakew \
        -DTEST=OFF \
        -DJPEG_INCLUDE_DIR="$libjpeg_turbo_INCLUDE_DIR" \
        -DJPEG_LIBRARY_RELEASE="$libjpeg_turbo_LIBRARY_DIR/libjpeg.a"
}
