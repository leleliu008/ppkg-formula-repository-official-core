pkg_set summary "Distributed revision control system"
pkg_set webpage "https://git-scm.com"
pkg_set git.url "https://github.com/git/git.git"
pkg_set src.url "https://www.kernel.org/pub/software/scm/git/git-2.36.1.tar.xz"
pkg_set src.sha "405d4a0ff6e818d1f12b3e92e1ac060f612adcb454f6299f70583058cb508370"
pkg_set license "GPL-2.0-only"
pkg_set depends "gettext expat curl pcre2 libidn2"
pkg_set bsystem "configure"
pkg_set binbstd "yes"
pkg_set ldflags "-Wl,-z,muldefs"

build() {
    export ac_cv_c_regex_with_reg_startend=no
    export ac_cv_lib_curl_curl_global_init=yes

    configure \
        --with-zlib="$zlib_INSTALL_DIR" \
        --with-curl="$curl_INSTALL_DIR" \
        --with-expat="$expat_INSTALL_DIR" \
        --with-iconv="$libiconv_INSTALL_DIR" \
        --with-openssl="$openssl_INSTALL_DIR" \
        --with-libpcre2="$pcre2_INSTALL_DIR" \
        --without-tcltk
}
