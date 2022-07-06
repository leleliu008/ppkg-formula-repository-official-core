pkg_set summary "Arbitrary precision numeric processing language"
pkg_set webpage "https://www.gnu.org/software/bc"
pkg_set src.url "https://ftp.gnu.org/gnu/bc/bc-1.07.1.tar.gz"
pkg_set src.sha "62adfca89b0a1c0164c2cdca59ca210c1d44c3ffc46daf9931cf4942664cb02a"
pkg_set license "GPL-3.0-or-later"
pkg_set dep.pkg "bison flex"
pkg_set bsystem "configure"

build() {
    configure --without-readline --without-libedit
}
