pkg_set summary "Pager program similar to more"
pkg_set webpage "http://www.greenwoodsoftware.com/less/index.html"
pkg_set src.url "http://www.greenwoodsoftware.com/less/less-551.tar.gz"
pkg_set src.sha "ff165275859381a63f19135a8f1f6c5a194d53ec3187f94121ecd8ef0795fe3d"
pkg_set license "GPL-3.0-or-later"
pkg_set dep.pkg "ncurses pcre2"
pkg_set bsystem "configure"

build() {
    configure --with-regex=pcre2 --with-secure
}
