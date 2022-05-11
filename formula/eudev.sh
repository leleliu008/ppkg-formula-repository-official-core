pkg_set summary "a fork of libudev"
pkg_set git.url "https://github.com/gentoo/eudev.git"
pkg_set src.url "https://dev.gentoo.org/~blueness/eudev/eudev-3.2.9.tar.gz"
pkg_set src.sha "89618619084a19e1451d373c43f141b469c9fd09767973d73dd268b92074d4fc"

build() {
    configure --disable-selinux
}
