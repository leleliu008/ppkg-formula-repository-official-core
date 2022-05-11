pkg_set summary "Extremely Fast Compression algorithm"
pkg_set webpage "https://lz4.org"
pkg_set git.url "https://github.com/lz4/lz4.git"
pkg_set src.url "https://github.com/lz4/lz4/archive/v1.9.2.tar.gz"
pkg_set src.sha "658ba6191fa44c92280d4aa2c271b0f4fbc0e34d249578dd05e50e76d0e5efcc"
pkg_set license "BSD-2-Clause"
pkg_set bsystem "make"

build() {
    makew -C "$PACKAGE_BSCRIPT_DIR" clean   &&
    makew -C "$PACKAGE_BSCRIPT_DIR" install \
        PREFIX="$PACKAGE_INSTALL_DIR" \
        CC="$CC" \
        CFLAGS="'$CFLAGS'" \
        LDFLAGS="'$LDFLAGS'" \
        AR="$AR" \
        BUILD_STATIC=yes \
        BUILD_SHARED=yes
}
