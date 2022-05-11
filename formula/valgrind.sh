pkg_set summary "Dynamic analysis tools (memory, debug, profiling)"
pkg_set webpage "https://www.valgrind.org"
pkg_set src.url "https://sourceware.org/pub/valgrind/valgrind-3.17.0.tar.bz2"
pkg_set src.sha "ad3aec668e813e40f238995f60796d9590eee64a16dff88421430630e69285a2"
pkg_set license "GPL-2.0"
pkg_set bsystem "configure"

build() {
    configure --enable-lto --enable-tls
}
