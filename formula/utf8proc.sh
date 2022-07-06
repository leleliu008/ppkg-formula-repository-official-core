pkg_set summary "Clean C library for processing UTF-8 Unicode data"
pkg_set webpage "https://juliastrings.github.io/utf8proc"
pkg_set git.url "https://github.com/JuliaStrings/utf8proc.git"
pkg_set src.url "https://github.com/JuliaStrings/utf8proc/archive/v2.7.0.tar.gz"
pkg_set src.sha "4bb121e297293c0fd55f08f83afab6d35d48f0af4ecc07523ad8ec99aa2b12a1"
pkg_set license "MIT"
pkg_set bsystem "cmake"

build() {
    CMAKE_COMMON_OPTIONS="-DUTF8PROC_INSTALL=ON -DUTF8PROC_ENABLE_TESTING=OFF"

    case $INSTALL_LIB in
        static) cmakew $CMAKE_COMMON_OPTIONS -DBUILD_SHARED_LIBS=OFF ;;
        shared) cmakew $CMAKE_COMMON_OPTIONS -DBUILD_SHARED_LIBS=ON  ;;
        both)   cmakew $CMAKE_COMMON_OPTIONS -DBUILD_SHARED_LIBS=OFF
                cmakew $CMAKE_COMMON_OPTIONS -DBUILD_SHARED_LIBS=ON
    esac
}
