pkg_set summary "Internet file retriever"
pkg_set webpage "https://www.gnu.org/software/wget"
pkg_set git.url "https://git.savannah.gnu.org/git/wget.git"
pkg_set src.url "https://ftp.gnu.org/gnu/wget/wget-1.21.1.tar.gz"
pkg_set src.sha "59ba0bdade9ad135eda581ae4e59a7a9f25e3a4bde6a5419632b31906120e26e"
pkg_set license "GPL-3.0-or-later"
pkg_set depends "openssl libidn2 util-linux"
pkg_set bsystem "configure"

build() {
    configure \
        --disable-pcre \
        --disable-pcre2 \
        --enable-threads=posix \
        --with-ssl=openssl \
        --with-libidn="$libidn2_INSTALL_DIR"
}
