pkg_set summary "General-purpose data compression with high compression ratio"
pkg_set webpage "https://tukaani.org/xz"
pkg_set src.url "https://tukaani.org/xz/xz-5.2.5.tar.gz"
pkg_set src.sha "f6f4910fd033078738bd82bfba4f49219d03b17eb0794eb91efbae419f4aba10"
pkg_set bsystem "configure"

build() {
    configure \
        --disable-external-sha256 \
        --disable-werror \
        --enable-assembler \
        --enable-threads=posix
}
