package set summary "Arbitrary precision numeric processing language"
package set webpage "https://www.gnu.org/software/bc"
package set src.url "https://ftp.gnu.org/gnu/bc/bc-1.07.1.tar.gz"
package set src.sum "62adfca89b0a1c0164c2cdca59ca210c1d44c3ffc46daf9931cf4942664cb02a"
package set license "GPL-3.0"
package set bsystem "configure"
package set dep.cmd "bison flex"
package set dep.pkg "readline"

build() {
    configure --without-readline --without-libedit
}
