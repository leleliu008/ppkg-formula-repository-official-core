pkg_set summary "JPEG image codec that aids compression and decompression"
pkg_set webpage "https://www.libjpeg-turbo.org"
pkg_set git.url "https://github.com/libjpeg-turbo/libjpeg-turbo.git"
pkg_set src.url "https://downloads.sourceforge.net/project/libjpeg-turbo/2.0.6/libjpeg-turbo-2.0.6.tar.gz"
pkg_set src.sha "d74b92ac33b0e3657123ddcf6728788c90dc84dcb6a52013d758af3c4af481bb"
pkg_set license "IJG"
pkg_set depends "nasm"
pkg_set bsystem "cmake"

build() {
    cmakew \
        -DENABLE_STATIC=ON \
        -DENABLE_SHARED=ON \
        -DWITH_JAVA=OFF
}
