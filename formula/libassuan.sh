pkg_set summary "Assuan IPC Library"
pkg_set webpage "https://www.gnupg.org/related_software/libassuan"
pkg_set src.url "https://gnupg.org/ftp/gcrypt/libassuan/libassuan-2.5.3.tar.bz2"
pkg_set src.sha "91bcb0403866b4e7c4bc1cc52ed4c364a9b5414b3994f718c70303f7f765e702"
pkg_set license "GPL-3.0"
pkg_set dep.pkg "libgpg-error"
pkg_set bsystem "configure"

build() {
    configure --with-libgpg-error-prefix="$libgpg_error_INSTALL_DIR"
}
