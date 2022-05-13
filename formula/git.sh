pkg_set summary "Distributed revision control system"
pkg_set webpage "https://git-scm.com"
pkg_set git.url "https://github.com/git/git.git"
pkg_set src.url "https://www.kernel.org/pub/software/scm/git/git-2.36.1.tar.xz"
pkg_set src.sha "405d4a0ff6e818d1f12b3e92e1ac060f612adcb454f6299f70583058cb508370"
pkg_set license "GPL-2.0-only"
pkg_set depends "gettext libiconv expat curl openssl pcre2 zlib"
pkg_set bsystem "configure"
pkg_set binbstd 'yes'

build() {
    export ac_cv_c_regex_with_reg_startend=n
    configure \
        --with-zlib="$zlib_INSTALL_DIR" \
        --with-iconv="$libiconv_INSTALL_DIR" \
        --with-curl \
        --with-expat \
        --with-openssl \
        --with-libpcre2 \
        --without-tcltk
}
