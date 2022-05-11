pkg_set summary "Alternative to backtracking PCRE-style regular expression engines"
pkg_set version "2021-02-02"
pkg_set git.url "https://github.com/google/re2.git"
pkg_set src.url "https://github.com/google/re2/archive/${PACKAGE_VERSION}.tar.gz"
pkg_set src.sha "1396ab50c06c1a8885fb68bf49a5ecfd989163015fd96699a180d6414937f33f"
pkg_set license "BSD-3-Clause"
pkg_set bsystem "cmake"

build() {
    cmakew -DRE2_BUILD_TESTING=OFF
}
