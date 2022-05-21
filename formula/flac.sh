pkg_set summary "Free lossless audio codec"
pkg_set webpage "https://xiph.org/flac"
pkg_set git.url "https://github.com/xiph/flac.git"
pkg_set src.url "https://github.com/xiph/flac/archive/1.3.3.tar.gz"
pkg_set src.sha "668cdeab898a7dd43cf84739f7e1f3ed6b35ece2ef9968a5c7079fe9adfe1689"
pkg_set depends "libogg libiconv"
pkg_set bsystem "autogen"

build() {
    build_with_configure
}

build_with_cmake() {
    cmakew \
    -DBUILD_EXAMPLES=OFF \
    -DBUILD_CXXLIBS=ON \
    -DWITH_ASM=OFF \
    -DWITH_OGG=ON \
    -DOGG_INCLUDE_DIR="$libogg_INCLUDE_DIR" \
    -DOGG_LIBRARY="$libogg_LIBRARY_DIR/libogg.a"
}

build_with_configure() {
    configure \
        --with-ogg="$libogg_INSTALL_DIR" \
        --disable-oggtest \
        --disable-valgrind-testing \
        --disable-thorough-tests \
        --disable-exhaustive-tests \
        --disable-examples \
        --disable-xmms-plugin \
        --disable-doxygen-docs
}

prepare_with_cmake() {
    cat > src/share/getopt/CMakeLists.txt <<EOF
check_include_file("string.h" HAVE_STRING_H)
add_library(getopt STATIC getopt.c getopt1.c)
EOF
}

prepare_with_configure() {
    ./autogen.sh
}

