package set summary "Highly capable, feature-rich programming language"
package set webpage "https://www.perl.org"
package set src.git "https://github.com/perl/perl5.git"
package set src.url "https://www.cpan.org/src/5.0/perl-5.32.1.tar.xz"
package set src.sum "57cc47c735c8300a8ce2fa0643507b44c4ae59012bfdad0121313db639e02309"
package set license "GPL-1.0-or-later"
package set dep.cmd "make"
package set binsrcd 'true'

build() {
    ./configure -Dprefix=$PACKAGE_INSTALL_DIR
}
