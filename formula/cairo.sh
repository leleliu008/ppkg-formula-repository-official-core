pkg_set summary "Vector graphics library with cross-device output support"
pkg_set webpage "https://cairographics.org"
pkg_set src.url "https://cairographics.org/releases/cairo-1.16.0.tar.xz"
pkg_set src.sha "5e7b29b3f113ef870d1e3ecf8adf21f923396401604bda16d44be45e66052331"
pkg_set license "LGPL-2.1"
pkg_set dep.pkg "libxml2 libpng pixman lzo glib fontconfig"
pkg_set bsystem "configure"

build() {
    configure \
        --without-x \
        --disable-valgrind \
        --enable-xml \
        --enable-png \
        --enable-pdf \
        --enable-svg \
        --enable-ft \
        --enable-fc
}
