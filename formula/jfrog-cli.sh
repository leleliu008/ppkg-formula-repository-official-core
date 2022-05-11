pkg_set summary "Command-line interface for Jfrog Artifactory and Bintray"
pkg_set webpage "https://www.jfrog.com/confluence/display/CLI/JFrog+CLI"
pkg_set git.url "https://github.com/jfrog/jfrog-cli.git"
pkg_set src.url "https://github.com/jfrog/jfrog-cli/archive/v1.45.1.tar.gz"
pkg_set src.sha "f2869aaecc096a6d3e65a7a8dce17876143d0bb744be4d0ce9749e6f1d7fdfae"
pkg_set license "Apache-2.0"
pkg_set bsystem "go"

build() {
    run go build -v -trimpath -o jfrog &&
    run install_bins jfrog
}
