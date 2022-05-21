pkg_set summary "Clean C library for processing UTF-8 Unicode data"
pkg_set webpage "https://juliastrings.github.io/utf8proc"
pkg_set git.url "https://github.com/JuliaStrings/utf8proc.git"
pkg_set src.url "https://github.com/JuliaStrings/utf8proc/archive/v2.6.1.tar.gz"
pkg_set src.sha "4c06a9dc4017e8a2438ef80ee371d45868bda2237a98b26554de7a95406b283b"
pkg_set license "MIT"
pkg_set bsystem "cmake-make"

build() {
    cmakew \
        -DUTF8PROC_INSTALL=ON \
        -DUTF8PROC_ENABLE_TESTING=OFF &&
    gmakew -C "$PACKAGE_INSTALLING_BST_DIR" libutf8proc.pc prefix="$PACKAGE_INSTALL_DIR" &&
    install_pcfs "$PACKAGE_INSTALLING_BST_DIR/libutf8proc.pc"
}
