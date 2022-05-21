pkg_set summary "H.265/HEVC encoder"
pkg_set webpage "http://x265.org"
pkg_set src.url "https://bitbucket.org/multicoreware/x265_git/get/3.4.tar.gz"
pkg_set src.sha "7f2771799bea0f53b5ab47603d5bea46ea2a221e047a7ff398115e9976fd5f86"
pkg_set license "GPL-2.0-only"
pkg_set bscript "source"
pkg_set bsystem "cmake"

build() {
    cmakew \
        -DENABLE_PIC=ON \
        -DENABLE_CLI=ON \
        -DENABLE_SHARED=ON \
        -DENABLE_ASSEMBLY=OFF
}
