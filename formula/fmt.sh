pkg_set summary "Open-source formatting library for C++"
pkg_set webpage "https://fmt.dev"
pkg_set src.url "https://github.com/fmtlib/fmt/archive/7.1.2.tar.gz"
pkg_set src.sha "4119a1c34dff91631e1d0a3707428f764f1ea22fe3cd5e70af5b4ccd5513831c"
pkg_set license "MIT"
pkg_set bsystem "cmake"

build() {
    cmakew \
        -DFMT_FUZZ=OFF \
        -DFMT_TEST=OFF \
        -DFMT_INSTALL=ON \
        -DFMT_WERROR=OFF \
        -DFMT_PEDANTIC=OFF
}
