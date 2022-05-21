pkg_set summary "Subtitle renderer for the ASS/SSA subtitle format"
pkg_set git.url "https://github.com/libass/libass.git"
pkg_set src.url "https://github.com/libass/libass/releases/download/0.15.0/libass-0.15.0.tar.xz"
pkg_set src.sha "9f09230c9a0aa68ef7aa6a9e2ab709ca957020f842e52c5b2e52b801a7d9e833"
pkg_set license "ISC"
pkg_set bsystem "configure"
pkg_set depends "fontconfig fribidi freetype2-with-harfbuzz"

build() {
    configure --enable-large-tiles
}
