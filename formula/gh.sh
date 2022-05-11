pkg_set summary "GitHub command-line tool"
pkg_set git.url "https://github.com/cli/cli.git"
pkg_set src.url "https://github.com/cli/cli/archive/v1.5.0.tar.gz"
pkg_set src.sha "49c42a3b951b67e29bc66e054fedb90ac2519f7e1bfc5c367e82cb173e4bb056"
pkg_set license "MIT"
pkg_set bsystem "go"

build() {
    run go build -v -trimpath -ldflags "\"-X github.com/cli/cli/internal/build.Date=$(date +%Y-%m-%d) -X github.com/cli/cli/internal/build.Version=${PACKAGE_VERSION}\"" -o gh ./cmd/gh &&
    run install_bins gh
}
