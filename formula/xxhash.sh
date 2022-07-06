pkg_set summary "Extremely fast non-cryptographic hash algorithm"
pkg_set git.url "https://github.com/Cyan4973/xxHash.git"
pkg_set src.url "https://github.com/Cyan4973/xxHash/archive/v0.8.1.tar.gz"
pkg_set src.sha "3bb6b7d6f30c591dd65aaaff1c8b7a5b94d81687998ca9400082c739a690436c"
pkg_set license "BSD-2-Clause"
pkg_set bsystem "gmake"
pkg_set binbstd "yes"

build() {
    gmakew clean   &&
    gmakew install PREFIX="$PACKAGE_INSTALL_DIR" CC="$CC" CFLAGS="'$CFLAGS'" CPPFLAGS="'$CPPFLAGS'" LDFLAGS="'$LDFLAGS'" AR="$AR" SONAME_FLAGS=-shared
}
