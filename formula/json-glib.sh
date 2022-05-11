pkg_set summary "Library for JSON, based on GLib"
pkg_set webpage "https://wiki.gnome.org/Projects/JsonGlib"
pkg_set src.url "https://download.gnome.org/sources/json-glib/1.6/json-glib-1.6.0.tar.xz"
pkg_set src.sha "0d7c67602c4161ea7070fab6c5823afd9bd7f7bc955f652a50d3753b08494e73"
pkg_set license "LGPL-2.1-or-later"
pkg_set bsystem "meson"
pkg_set dep.cmd "pkg-config"
pkg_set dep.pkg "glib"
pkg_set ldflags "-lgmodule-2.0 -lffi -lpcre -lz"

build() {
    mesonw \
        -Dtests=false \
        -Dman=false \
        -Dgtk_doc=disabled \
        -Dintrospection=disabled
}
