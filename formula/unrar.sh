pkg_set summary "Extract, view, and test RAR archives"
pkg_set webpage "https://www.rarlab.com"
pkg_set src.url "https://www.rarlab.com/rar/unrarsrc-6.0.2.tar.gz"
pkg_set src.sha "81bf188333f89c976780a477af27f651f54aa7da9312303d8d1a804696d3edd3"
pkg_set bsystem "gmake"
pkg_set binbstd "yes"

build() {
    install -d "$PACKAGE_INSTALL_DIR/bin" &&
    install -d "$PACKAGE_INSTALL_DIR/lib"
    gmakew -f makefile unrar CXX="$CXX" AR="$AR" STRIP="$STRIP" CXXFLAGS="'$CXXFLAGS'" CPPFLAGS="'$CPPFLAGS'" LDFLAGS="'$LDFLAGS'" &&
    gmakew -f makefile install-unrar DESTDIR="$PACKAGE_INSTALL_DIR" &&
    gmakew -f makefile lib   CXX="$CXX" AR="$AR" STRIP="$STRIP" CXXFLAGS="'$CXXFLAGS'" CPPFLAGS="'$CPPFLAGS'" LDFLAGS="'$LDFLAGS'" &&
    gmakew -f makefile install-lib   DESTDIR="$PACKAGE_INSTALL_DIR"
}
