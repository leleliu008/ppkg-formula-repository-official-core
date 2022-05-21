pkg_set summary "CDDB server access library"
pkg_set webpage "https://libcddb.sourceforge.io"
pkg_set src.url "https://downloads.sourceforge.net/project/libcddb/libcddb/1.3.2/libcddb-1.3.2.tar.bz2"
pkg_set src.sha "35ce0ee1741ea38def304ddfe84a958901413aa829698357f0bee5bb8f0a223b"
pkg_set bsystem "configure"
pkg_set depends "libiconv"

build() {
    configure \
        --with-libiconv-prefix="$libiconv_INSTALL_DIR" \
        ac_cv_func_malloc_0_nonnull=yes \
        ac_cv_func_realloc_0_nonnull=yes
}
