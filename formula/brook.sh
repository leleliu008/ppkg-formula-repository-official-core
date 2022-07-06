pkg_set summary "Cross-platform strong encryption and not detectable proxy. Zero-Configuration"
pkg_set webpage "https://txthinking.github.io/brook/"
pkg_set git.url "https://github.com/txthinking/brook.git"
pkg_set src.url "https://github.com/txthinking/brook/archive/refs/tags/v20220707.tar.gz"
pkg_set src.sha "377d6be82a8e122cc2e1c87ea10d2f404be6e4cf85304f329b01654e8f551753"
pkg_set license "GPL-3.0-only"
pkg_set bsystem "go"

build() {
    gow ./cli/brook
}
