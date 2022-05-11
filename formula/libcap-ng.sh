pkg_set summary "Library making programming with POSIX capabilities easier than traditional libcap"
pkg_set webpage "https://people.redhat.com/sgrubb/libcap-ng"
pkg_set git.url "https://github.com/stevegrubb/libcap-ng.git"
pkg_set src.url "https://github.com/stevegrubb/libcap-ng/archive/v0.8.2.tar.gz"
pkg_set src.sha "65b86885b8d873e55c05bd49427fd370d559b26f0c2089ac9194828e6a2fe233"
pkg_set license "LGPL-2.1"
pkg_set bsystem "autogen"

build() {
    configure \
        --with-warn \
        --without-debug \
        --without-python \
        --without-python3
}
