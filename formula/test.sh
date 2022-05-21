pkg_set summary "C test project"
pkg_set git.url "https://github.com/leleliu008/C.git"
#package set src.url "dir:///Users/leleliu008/git/C"
pkg_set bsystem "gmake"

build() {
    #WHICH=standard/posix/sys/stat.h
    #WHICH=standard/iso/variable/__thread
    WHICH=standard/iso/header/stdio.h/fprintf
    
    gmakew -C $PACKAGE_INSTALLING_BST_DIR/$WHICH clean
    gmakew -C $PACKAGE_INSTALLING_BST_DIR/$WHICH
}
