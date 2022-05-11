pkg_set summary "C test project"
pkg_set git.url "https://github.com/leleliu008/C.git"
#package set src.url "dir:///Users/leleliu008/git/C"
pkg_set bsystem "make"

build() {
    #WHICH=standard/posix/sys/stat.h
    #WHICH=standard/iso/variable/__thread
    WHICH=standard/iso/header/stdio.h/fprintf
    
    makew -C $PACKAGE_BSCRIPT_DIR/$WHICH clean
    makew -C $PACKAGE_BSCRIPT_DIR/$WHICH
}
