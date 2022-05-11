pkg_set summary "Go git service"
pkg_set webpage "https://gogs.io"
pkg_set git.url "https://github.com/gogs/gogs.git"
pkg_set src.url "https://github.com/gogs/gogs/archive/v0.12.3.tar.gz"
pkg_set src.sha "6a0e1e369d2e097a73fe99fb78046db0b022ce0c229d3977068e7b21e2e364c8"
pkg_set license "MIT"
pkg_set bsystem "go"

build() {
    run go build -v -trimpath -o gogs &&
    run install_bins gogs
}
