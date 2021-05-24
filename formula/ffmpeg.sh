package set summary "Play, record, convert, and stream audio and video"
package set webpage "https://ffmpeg.org"
package set src.url "https://ffmpeg.org/releases/ffmpeg-4.2.3.tar.xz"
package set src.sum "9df6c90aed1337634c1fb026fb01c154c29c82a64ea71291ff2da9aacb9aad31"
package set bsystem "make"
package set dep.pkg "sdl2 opus libwebp libvorbis libtheora speex x264 x265 lame"
package set binsrcd true

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
    makew clean &&
    makew install &&
    cp ffbuild/config.log "$BUILD_DIR"
}
