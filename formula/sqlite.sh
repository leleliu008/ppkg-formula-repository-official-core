pkg_set summary "Command-line interface for SQLite"
pkg_set webpage "https://sqlite.org"
pkg_set src.url "https://sqlite.org/2022/sqlite-autoconf-3380500.tar.gz"
pkg_set src.sha "5af07de982ba658fd91a03170c945f99c971f6955bc79df3266544373e39869c"
pkg_set version "3.38.5"
pkg_set git.url "https://github.com/sqlite/sqlite.git"
pkg_set depends "readline zlib"
pkg_set bsystem "configure"

build() {
    configure \
        --disable-editline \
        --enable-readline \
        --enable-static-shell
}
