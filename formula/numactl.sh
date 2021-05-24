package set summary "NUMA support for Linux"
package set src.git "https://github.com/numactl/numactl.git"
package set src.url "https://github.com/numactl/numactl/releases/download/v2.0.14/numactl-2.0.14.tar.gz"
package set src.sum "826bd148c1b6231e1284e42a4db510207747484b112aee25ed6b1078756bcff6"
package set bsystem "configure"

prepare() {
    sed_in_place 's/-lrt//' Makefile.in
}
