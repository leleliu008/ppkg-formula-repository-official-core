pkg_set summary "C/C++ and Java libraries for Unicode and globalization"
pkg_set webpage "http://site.icu-project.org/home"
pkg_set version "67.1"
pkg_set src.url "https://github.com/unicode-org/icu/releases/download/release-67-1/icu4c-67_1-src.tgz"
pkg_set src.sha "94a80cd6f251a53bd2a997f6f1b5ac6653fe791dfab66e1eb0227740fb86d5dc"
pkg_set license "ICU"
pkg_set bscript "source"
pkg_set bsystem "configure"

build() {
    configure \
        --enable-release \
        --enable-tools \
        --enable-fuzzer \
        --disable-tests \
        --disable-samples
}
