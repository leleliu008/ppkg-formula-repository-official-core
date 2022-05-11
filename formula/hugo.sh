pkg_set summary "Configurable static site generator"
pkg_set webpage "https://gohugo.io"
pkg_set git.url "https://github.com/gohugoio/hugo.git"
pkg_set src.url "https://github.com/gohugoio/hugo/archive/v0.80.0.tar.gz"
pkg_set src.sha "4ddcd6ebea21e5fd4067db4a481ab7810e34496d5991a3520169c8f5ee1d38bb"
pkg_set license "Apache-2.0"
pkg_set bsystem "go"

build() {
    run go build -v -trimpath -o hugo &&
    run install_bins hugo
}
