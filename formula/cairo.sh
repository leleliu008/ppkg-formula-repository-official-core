package set summary "Vector graphics library with cross-device output support"
package set webpage "https://cairographics.org"
package set src.url "https://cairographics.org/releases/cairo-1.16.0.tar.xz"
package set src.sum "5e7b29b3f113ef870d1e3ecf8adf21f923396401604bda16d44be45e66052331"
package set license "LGPL-2.1"
package set dep.pkg "libxml2 libpng pixman lzo glib fontconfig"
package set dep.cmd "pkg-config"
package set bsystem "configure"

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
