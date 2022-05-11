pkg_set summary "Library for interacting with JSON"
pkg_set git.url "https://github.com/open-source-parsers/jsoncpp.git"
pkg_set src.url "https://github.com/open-source-parsers/jsoncpp/archive/1.9.3.tar.gz"
pkg_set src.sha "8593c1d69e703563d94d8c12244e2e18893eeb9a8a9f8aa3d09a327aa45c8f7d"
pkg_set license "MIT"
pkg_set bsystem "cmake"

build() {
    cmakew \
        -DJSONCPP_WITH_EXAMPLE=OFF \
        -DJSONCPP_WITH_TESTS=OFF \
        -DJSONCPP_WITH_POST_BUILD_UNITTEST=OFF \
        -DJSONCPP_WITH_WARNING_AS_ERROR=OFF \
        -DJSONCPP_WITH_PKGCONFIG_SUPPORT=ON \
        -DJSONCPP_WITH_CMAKE_PACKAGE=ON \
        -DJSONCPP_USE_SECURE_MEMORY=ON \
        -DJSONCPP_WITH_STRICT_ISO=ON
}
