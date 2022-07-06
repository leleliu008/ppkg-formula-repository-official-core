pkg_set summary "Go implementation of the Ethereum protocol"
pkg_set webpage "https://geth.ethereum.org/"
pkg_set git.url "https://github.com/ethereum/go-ethereum.git"
pkg_set src.url "https://github.com/ethereum/go-ethereum/archive/refs/tags/v1.10.20.tar.gz"
pkg_set src.sha "15ff54f0a4444eb9faa7c1f6219d3a1db5d547178b4eef6679bb601abc681f9d"
pkg_set license "LGPL-3.0-or-later|COPYING|https://raw.githubusercontent.com/ethereum/go-ethereum/master/COPYING"
pkg_set bsystem "go"

build() {
    for item in geth abigen bootnode ethkey evm rlpdump puppeth
    do
        gow ./cmd/$item || return 1
    done
}
