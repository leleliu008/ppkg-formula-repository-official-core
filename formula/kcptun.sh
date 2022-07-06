pkg_set summary "Stable & Secure Tunnel based on KCP with N:M multiplexing and FEC"
pkg_set git.url "https://github.com/xtaci/kcptun.git"
pkg_set src.url "https://github.com/xtaci/kcptun/archive/v20220628.tar.gz"
pkg_set src.sha "6a63facc902594b4ca5f0456e58196cf7b2a2451594fe2f69b55ac712ceb85e8"
pkg_set license "MIT"
pkg_set bsystem "go"

build() {
    for item in server client
    do
        gow -X main.VERSION=$PACKAGE_VERSION -o kcptun_$item ./$item || return 1
    done

    run install_etcs examples/local.json
}
