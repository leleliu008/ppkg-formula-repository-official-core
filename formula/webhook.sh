pkg_set summary "HTTP-server to execute shell commands."
pkg_set git.url "https://github.com/adnanh/webhook.git"
pkg_set license "MIT"
pkg_set bsystem "go"

build() {
    run go build -v -trimpath -o webhook &&
    run install_bins webhook
}
