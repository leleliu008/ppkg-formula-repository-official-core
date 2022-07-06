pkg_set summary "Pure Go web server with Lua, Markdown, HTTP/2 and template support"
pkg_set git.url "https://github.com/xyproto/algernon.git"
pkg_set src.url "https://github.com/xyproto/algernon/archive/refs/tags/v1.13.0.tar.gz"
pkg_set src.sha "8327c1687990386eb5a48d15fd46fc69e17d400c29d726b34f6087c9c4887b9c"
pkg_set license "MIT"
pkg_set bsystem "go"

build() {
    gow -mod vendor
}
