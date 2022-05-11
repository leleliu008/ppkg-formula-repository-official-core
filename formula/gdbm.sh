pkg_set summary "GNU database manager"
pkg_set webpage "https://www.gnu.org/software/gdbm"
pkg_set src.url "https://ftp.gnu.org/gnu/gdbm/gdbm-1.19.tar.gz"
pkg_set src.sha "37ed12214122b972e18a0d94995039e57748191939ef74115b1d41d8811364bc"
pkg_set license "GPL-3.0"
pkg_set bsystem "configure"
pkg_set dep.cmd "gzip base64"

build() {
    configure --enable-libgdbm-compat
}
