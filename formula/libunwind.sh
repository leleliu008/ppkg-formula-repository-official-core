pkg_set summary "C API for determining the call-chain of a program"
pkg_set webpage "https://www.nongnu.org/libunwind"
pkg_set src.url "https://download.savannah.nongnu.org/releases/libunwind/libunwind-1.5.0.tar.gz"
pkg_set src.sha "90337653d92d4a13de590781371c604f9031cdb50520366aa1e3a91e1efb1017"
pkg_set license "MIT"
pkg_set bsystem "configure"
pkg_set dep.pkg "xz zlib"

build() {
    configure --disable-tests --disable-coredump
}
