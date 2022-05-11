pkg_set summary "7-Zip (high compression file archiver) implementation"
pkg_set git.url "https://github.com/jinfeihan57/p7zip.git"
pkg_set src.url "https://github.com/jinfeihan57/p7zip/archive/v17.03.tar.gz"
pkg_set src.sha "bb4b9b21584c0e076e0b4b2705af0dbe7ac19d378aa7f09a79da33a5b3293187"
pkg_set license "LGPL-2.1-or-later"
pkg_set dep.pkg "libiconv"
pkg_set ldflags "-liconv"
pkg_set cdefine "_UINT64_T_DECLARED"
pkg_set sourced "CPP/7zip/CMAKE"
pkg_set bsystem "cmake"

prepare() {
    echo 'install(PROGRAMS ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/7z_ DESTINATION bin RENAME 7z)' >> CMakeLists.txt &&
    echo 'install(PROGRAMS ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/7za DESTINATION bin)' >> CMakeLists.txt &&
    echo 'install(PROGRAMS ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/7zr DESTINATION bin)' >> CMakeLists.txt &&
    sed_in_place 's|SET(CMAKE_CXX_FLAGS "|SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} |' CMakeLists.txt
}
