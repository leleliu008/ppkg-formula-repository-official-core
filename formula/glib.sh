pkg_set summary "Core application library for C"
pkg_set webpage "https://developer.gnome.org/glib"
pkg_set src.url "https://download.gnome.org/sources/glib/2.66/glib-2.66.0.tar.xz"
pkg_set src.sha "c5a66bf143065648c135da4c943d2ac23cce15690fc91c358013b2889111156c"
pkg_set license "LGPL-2.1-or-later"
pkg_set bsystem "meson"
pkg_set depends "libiconv gettext libffi pcre zlib"
pkg_set ldflags "-lpcre -liconv -lm -lz"

build() {
    mesonw \
        -Dnls=disabled \
        -Dman=false \
        -Dgtk_doc=false \
        -Diconv=external \
        -Ddtrace=false \
        -Dinternal_pcre=false \
        -Dinstalled_tests=false \
        -Dbsymbolic_functions=false
}
