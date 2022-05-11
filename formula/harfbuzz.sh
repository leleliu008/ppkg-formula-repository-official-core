pkg_set summary "OpenType text shaping engine"
pkg_set git.url "https://github.com/harfbuzz/harfbuzz.git"
pkg_set src.url "https://github.com/harfbuzz/harfbuzz/archive/2.7.4.tar.gz"
pkg_set src.sha "daff8a4003ac420a8550760ed303ce33b310c8ea17b7f15b307d1969cabcebcb"
pkg_set license "MIT"
pkg_set bsystem "meson"
pkg_set dep.pkg "icu4c glib freetype2"
pkg_set ldflags "-lbz2 -lz -lm -lbrotlidec -lbrotlicommon -lpng -lpcre"

build() {
    mesonw \
        -Dicu=enabled \
        -Dglib=enabled \
        -Dcairo=disabled \
        -Dfreetype=enabled \
        -Dgraphite=disabled \
        -Dfontconfig=disabled \
        -Dgobject=disabled \
        -Dintrospection=disabled \
        -Ddocs=disabled \
        -Dtests=disabled \
        -Dbenchmark=disabled
}
