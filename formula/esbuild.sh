pkg_set summary "An extremely fast JavaScript bundler and minifier"
pkg_set webpage "https://esbuild.github.io"
pkg_set git.url "https://github.com/evanw/esbuild.git"
pkg_set src.url "https://github.com/evanw/esbuild/archive/v0.8.56.tar.gz"
pkg_set src.sha "45efe10eeef55349981466866960ab86ed99626b5ebd7b4b102dca9d922e5869"
pkg_set license "MIT"
pkg_set bsystem "go"

build() {
    run go build -v -trimpath -o esbuild ./cmd/esbuild &&
    run install_bins esbuild
}
