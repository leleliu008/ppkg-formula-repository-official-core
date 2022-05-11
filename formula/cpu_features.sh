pkg_set summary "Cross platform C99 library to get cpu features at runtime"
pkg_set git.url "https://github.com/google/cpu_features.git"
pkg_set src.url "https://github.com/google/cpu_features/archive/v0.5.0.tar.gz"
pkg_set src.sha "b967811cecd68412e0dc65e4964756a6ae48755456fa2c2f42034f6271ac2c27"
pkg_set license "Apache-2.0"
pkg_set bsystem "cmake"

build() {
    cmakew -DBUILD_PIC=ON
}
