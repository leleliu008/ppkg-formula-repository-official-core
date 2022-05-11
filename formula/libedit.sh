pkg_set summary "BSD-style licensed readline alternative"
pkg_set webpage "https://thrysoee.dk/editline"
pkg_set src.url "https://thrysoee.dk/editline/libedit-20191231-3.1.tar.gz"
pkg_set src.sha "dbb82cb7e116a5f8025d35ef5b4f7d4a3cdd0a3909a146a39112095a2d229071"
pkg_set bsystem "configure"
pkg_set dep.pkg "ncurses"
pkg_set cdefine "__STDC_ISO_10646__ NBBY=1"

build() {
    configure --disable-examples
}
