pkg_set summary "Graph visualization software from AT&T and Bell Labs"
pkg_set webpage "https://www.graphviz.org"
pkg_set src.url "https://www2.graphviz.org/Packages/stable/portable_source/graphviz-2.44.1.tar.gz"
pkg_set src.sha "8e1b34763254935243ccdb83c6ce108f531876d7a5dfd443f255e6418b8ea313"
pkg_set license "EPL-1.0"
pkg_set dep.cmd "pkg-config libtoolize libtool groff ps2pdf"
pkg_set dep.pkg "fontconfig libpng expat"
pkg_set ldflags "-lexpat -lz -lm"
pkg_set bsystem "autotools"

build() {
    configure --enable-swig=no
}
