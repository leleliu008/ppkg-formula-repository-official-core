pkg_set summary "Implementations for atomic memory update operations"
pkg_set git.url "https://github.com/ivmai/libatomic_ops.git"
pkg_set src.url "https://github.com/ivmai/libatomic_ops/releases/download/v7.6.10/libatomic_ops-7.6.10.tar.gz"
pkg_set src.sha "587edf60817f56daf1e1ab38a4b3c729b8e846ff67b4f62a6157183708f099af"
pkg_set license "GPL-2.0"
pkg_set bsystem "configure"

build() {
    configure \
        --disable-docs \
        --disable-gcov \
        --disable-werror \
        --disable-assertions
}
