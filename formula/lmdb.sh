pkg_set summary "Lightning memory-mapped database: key-value data store"
pkg_set webpage "https://symas.com/lmdb"
pkg_set src.url "https://git.openldap.org/openldap/openldap/-/archive/LMDB_0.9.28/openldap-LMDB_0.9.28.tar.bz2"
pkg_set src.sha "54f4a3a927793db950288e9254c0dfe35afc75af12cd92b8aaae0d1e990186c0"
pkg_set license "OLDAP-2.8"
pkg_set cdefine "MDB_USE_ROBUST=0"
pkg_set sourced "libraries/liblmdb"
pkg_set bsystem "make"
pkg_set binbstd 'YES'

build() {
    makew clean &&
    makew CC="$CC" XCFLAGS="'$CFLAGS $CPPFLAGS'" LDFLAGS="'$LDFLAGS'" AR="$AR" &&
    makew install prefix="$PACKAGE_INSTALL_DIR"
}
