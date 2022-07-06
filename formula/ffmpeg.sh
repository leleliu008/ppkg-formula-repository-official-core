pkg_set summary "Play, record, convert, and stream audio and video"
pkg_set webpage "https://ffmpeg.org"
pkg_set src.url "https://ffmpeg.org/releases/ffmpeg-4.2.3.tar.xz"
pkg_set src.sha "9df6c90aed1337634c1fb026fb01c154c29c82a64ea71291ff2da9aacb9aad31"
pkg_set bsystem "gmake"
pkg_set dep.pkg "sdl2 opus libwebp libvorbis libtheora speex x264 x265 lame"
pkg_set binbstd "yes"

build() {
    run ./configure \
        --prefix="$PACKAGE_INSTALL_DIR" \
        --ar="$AR" \
        --as="$AS" \
        --ld="$LD" \
        --cc="$CC" \
        --cxx="$CXX" \
        --nm="$NM" \
        --ranlib="$RANLIB" \
        --strip="$STRIP" \
        --enable-static \
        --enable-shared \
        --enable-pic \
        --disable-asm \
        --disable-doc \
        --disable-debug &&
    gmakew clean &&
    gmakew install &&
    cp ffbuild/config.log "$BUILD_DIR"
}
