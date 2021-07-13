package set summary "Distributed revision control system"
package set webpage "https://git-scm.com"
package set src.git "https://github.com/git/git.git"
package set src.url "https://www.kernel.org/pub/software/scm/git/git-2.31.1.tar.xz"
package set src.sum "9f61417a44d5b954a5012b6f34e526a3336dcf5dd720e2bb7ada92ad8b3d6680"
package set dep.pkg "gettext libiconv expat curl openssl pcre2 zlib"
package set license "GPL-2.0-only"
package set bsystem "configure"
package set binsrcd 'true'

build() {
    configure \
        --with-zlib="$zlib_INSTALL_DIR" \
        --with-iconv="$libiconv_INSTALL_DIR" \
        --with-curl \
        --with-expat \
        --with-openssl \
        --with-libpcre2
        #LIBS="'$zlib_LIBRARY_DIR/libz.a $gettext_LIBRARY_DIR/libintl.a $libiconv_LIBRARY_DIR/libiconv.a $libiconv_LIBRARY_DIR/libcharset.a'"
}
