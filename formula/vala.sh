pkg_set summary "Compiler for the GObject type system"
pkg_set webpage "https://wiki.gnome.org/Projects/Vala"
pkg_set src.url "https://download.gnome.org/sources/vala/0.50/vala-0.50.2.tar.xz"
pkg_set src.sha "2c0d5dc6d65d070f724063075424c403765ab7935c9e6fbcb84981b94d07ceda"
pkg_set license "LGPL-2.1-or-later"
pkg_set dep.pkg "glib graphviz"
pkg_set bsystem "configure"
pkg_set ldflags "-lpcre -lexpat -lffi -lxdot -lpathplan -lglob -lz -lm"

build() {
    configure --with-cgraph
}
