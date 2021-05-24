package set summary "Dynamic analysis tools (memory, debug, profiling)"
package set webpage "https://www.valgrind.org"
package set src.url "https://sourceware.org/pub/valgrind/valgrind-3.17.0.tar.bz2"
package set src.sum "ad3aec668e813e40f238995f60796d9590eee64a16dff88421430630e69285a2"
package set license "GPL-2.0"
package set bsystem "configure"

build() {
    configure --enable-lto --enable-tls
}
