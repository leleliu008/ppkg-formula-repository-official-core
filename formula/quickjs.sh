pkg_set summary "Small and embeddable JavaScript engine"
pkg_set webpage "https://bellard.org/quickjs"
pkg_set version "2020-11-08"
pkg_set src.url "https://bellard.org/quickjs/quickjs-${PACKAGE_VERSION}.tar.xz"
pkg_set src.sha "2e9d63dab390a95ed365238f21d8e9069187f7ed195782027f0ab311bb64187b"
pkg_set license "MIT"
pkg_set bsystem "gmake"
pkg_set binbstd "yes"

build() {
    gmakew clean &&
    gmakew install CC=$CC AR=$AR STRIP=$STRIP prefix="$PACKAGE_INSTALL_DIR"
}
