pkg_set summary "Copies files into or out of a cpio or tar archive"
pkg_set webpage "https://www.gnu.org/software/cpio"
pkg_set src.url "https://ftp.gnu.org/gnu/cpio/cpio-2.13.tar.bz2"
pkg_set src.sha "eab5bdc5ae1df285c59f2a4f140a98fc33678a0bf61bdba67d9436ae26b46f6d"

build() {
    configure --disable-mt
}
