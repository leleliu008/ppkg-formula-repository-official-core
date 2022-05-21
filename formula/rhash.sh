pkg_set summary "Utility for computing and verifying hash sums of files"
pkg_set webpage "http://rhash.sourceforge.net"
pkg_set src.url "https://github.com/rhash/RHash/archive/v1.4.0.tar.gz"
pkg_set src.sha "2ea39540f5c580da0e655f7b483c19e0d31506aed4202d88e8459fa7aeeb8861"
pkg_set license "0BSD"
pkg_set bsystem "gmake"

pkg_set binbstd "yes"

build() {
    run ./configure \
        --cc="$CC" \
        --ar="$AR" \
        --extra-cflags="\"$CFLAGS $CPPFLAGS\"" \
        --extra-ldflags="\"$LDFLAGS\"" \
        --target="$TARGET_TRIPLE" \
        --prefix="$PACKAGE_INSTALL_DIR" \
        --enable-static \
        --enable-lib-static \
        --enable-lib-shared &&
    gmakew clean &&
    gmakew &&
    gmakew install
}
