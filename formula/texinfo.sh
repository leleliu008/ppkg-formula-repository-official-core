pkg_set summary "Official documentation format of the GNU project"
pkg_set webpage "https://www.gnu.org/software/texinfo"
pkg_set src.url "https://ftp.gnu.org/gnu/texinfo/texinfo-6.7.tar.xz"
pkg_set src.sha "988403c1542d15ad044600b909997ba3079b10e03224c61188117f3676b02caa"
pkg_set license "GPL-3.0"
pkg_set bsystem "configure"

build() {
    configure --with-included-regex --enable-threads=posix
}
