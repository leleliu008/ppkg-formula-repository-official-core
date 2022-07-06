pkg_set summary "Graph visualization software from AT&T and Bell Labs"
pkg_set webpage "https://www.graphviz.org"
pkg_set src.url "https://www2.graphviz.org/Packages/stable/portable_source/graphviz-2.44.1.tar.gz"
pkg_set src.sha "8e1b34763254935243ccdb83c6ce108f531876d7a5dfd443f255e6418b8ea313"
pkg_set license "EPL-1.0"
pkg_set dep.pkg "groff ps2pdf fontconfig libpng expat"
pkg_set bsystem "autotools"
pkg_set ldflags "-lexpat -lz -lm"

build() {
    configure --enable-swig=no
}
