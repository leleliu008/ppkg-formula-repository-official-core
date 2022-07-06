pkg_set summary "Generate compilation database for clang tooling"
pkg_set git.url "https://github.com/rizsotto/Bear.git"
pkg_set src.url "https://github.com/rizsotto/Bear/archive/3.0.19.tar.gz"
pkg_set src.sha "2fcfe2c6e029182cfc54ed26b3505c0ef12b0f43df03fb587f335afdc2ca9431"
pkg_set license "GPL-3.0-or-later"
pkg_set dep.pkg "fmt grpc nlohmann-json spdlog"
pkg_set bsystem "cmake"

build() {
    cmakew \
        -DENABLE_UNIT_TESTS=OFF \
        -DENABLE_FUNC_TESTS=OFF
}
