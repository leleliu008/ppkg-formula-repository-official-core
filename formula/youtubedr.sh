pkg_set summary "Download Youtube Video in Golang"
pkg_set git.url "https://github.com/kkdai/youtube.git"
pkg_set src.url "https://github.com/kkdai/youtube/archive/v2.4.1.tar.gz"
pkg_set src.sha "ae6387c097c9359d71d0e8dec864d6553e47e7edfb93ddbfe017062a05f4b396"
pkg_set license "MIT"
pkg_set bsystem "go"

build() {
    run go build -v -x -trimpath -ldflags "\"-s -w -X main.version=${PACKAGE_VERSION} -X main.date=$(date -u +'%Y-%m-%dT%H:%M:%SZ')\"" -o youtubedr ./cmd/youtubedr &&
    run install_bins youtubedr
}
