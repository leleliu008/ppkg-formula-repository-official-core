pkg_set summary "Extremely fast non-cryptographic hash algorithm"
pkg_set git.url "https://github.com/Cyan4973/xxHash.git"
pkg_set src.url "https://github.com/Cyan4973/xxHash/archive/v0.8.0.tar.gz"
pkg_set src.sha "7054c3ebd169c97b64a92d7b994ab63c70dd53a06974f1f630ab782c28db0f4f"
pkg_set license "BSD-2-Clause"
pkg_set bsystem "make"

build() {
    makew -C "$PACKAGE_BSCRIPT_DIR" clean   &&
    makew -C "$PACKAGE_BSCRIPT_DIR" install PREFIX="$PACKAGE_INSTALL_DIR" CC="$CC" CFLAGS="'$CFLAGS'" CPPFLAGS="'$CPPFLAGS'" LDFLAGS="'$LDFLAGS -shared'" AR="$AR"
}
