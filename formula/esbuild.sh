pkg_set summary "An extremely fast JavaScript bundler and minifier"
pkg_set webpage "https://esbuild.github.io"
pkg_set git.url "https://github.com/evanw/esbuild.git"
pkg_set src.url "https://github.com/evanw/esbuild/archive/v0.14.48.tar.gz"
pkg_set src.sha "fbc63176242509f1b4a3738b1cb1d340fb608374cf0647e45e83f95227fceabc"
pkg_set license "MIT"
pkg_set bsystem "go"

build() {
    gow ./cmd/esbuild
}
