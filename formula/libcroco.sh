pkg_set summary "CSS parsing and manipulation toolkit for GNOME"
pkg_set webpage "https://gitlab.gnome.org/GNOME/libcroco"
pkg_set src.url "https://download.gnome.org/sources/libcroco/0.6/libcroco-0.6.13.tar.xz"
pkg_set src.sha "767ec234ae7aa684695b3a735548224888132e063f92db585759b422570621d4"
pkg_set bsystem "configure"
pkg_set depends "glib libxml2"
pkg_set ldflags "-lpcre"

build() {
    configure \
        --disable-gtk-doc \
        --disable-Bsymbolic \
        --enable-checks
}
