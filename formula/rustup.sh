pkg_set summary "Rust toolchain installer"
pkg_set webpage "https://github.com/rust-lang/rustup"
pkg_set src.url "dir:///dev/null"

build() {
    fetch 'https://sh.rustup.rs' --output-name=rustup-init.sh
    bash rustup-init.sh
}
