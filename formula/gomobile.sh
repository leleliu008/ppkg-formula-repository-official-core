pkg_set summary "a tool for building and running mobile apps written in Go"
pkg_set git.url "https://github.com/golang/mobile.git"
pkg_set bsystem "go"

build() {
    run go build -v -trimpath -o gobind ./cmd/gobind &&
    run go build -v -trimpath -o gomobile ./cmd/gomobile &&
    run install_bins gobind &&
    run install_bins gomobile
}
