pkg_set summary "Palette quantization library extracted from pnquant2"
pkg_set webpage "https://pngquant.org/lib"
pkg_set git.url "https://github.com/ImageOptim/libimagequant.git"
pkg_set src.url "https://github.com/ImageOptim/libimagequant/archive/2.14.1.tar.gz"
pkg_set src.sha "b5fa27da1f3cf3e8255dd02778bb6a51dc71ce9f99a4fc930ea69b83200a7c74"
pkg_set license "GPL-3.0-or-later"
pkg_set bsystem "gmake"

pkg_set binbstd "yes"

build() {
    export OSTYPE=Linux
 
    run ./configure \
        --prefix="$PACKAGE_INSTALL_DIR" \
        --disable-sse \
        CC="$CC" \
        CFLAGS="\"$CFLAGS $CPPFLAGS\"" \
        LDFLAGS="\"$LDFLAGS\"" &&
    gmakew clean &&
    gmakew install
}
