pkg_set summary "Portable Foreign Function Interface library"
pkg_set webpage "https://sourceware.org/libffi"
pkg_set src.url "https://github.com/libffi/libffi/releases/download/v3.3/libffi-3.3.tar.gz"
pkg_set src.sha "72fba7922703ddfa7a028d513ac15a85c8d54c8d67f55fa5a4802885dc652056"
pkg_set bsystem "configure"

build() {
    configure --disable-symvers --enable-docs
}
