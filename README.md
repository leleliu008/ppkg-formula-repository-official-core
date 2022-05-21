# ppkg-formula-repository
the offical formula repository for [ppkg](https://github.com/leleliu008/ppkg)

## what's formula
formula is a POSIX sh script used to config a package infomation and describe how to compile a package for [ppkg](https://github.com/leleliu008/ppkg).

## the function must be invoked on top of the formula
```
pkg_set <KEY> <VALUE>
```
|KEY|required?|overview|
|-|-|-|
|`summary`|required|the summary of this package.|
|`webpage`|optional|the home webpage of this package.<br>If this key is not present, `git.url` must be present.|
|`version`|optional|the version of this package.<br>If this key is not present, it will be calculated from `src.url`|
|`license`|optional|the license of this package.|
||||
|`git.url`|optional|the source code git repository.<br>must end with `.git`|
|`git.sha`|optional|the full git commit id, 40-byte hexadecimal string, which to be fetched as source code|
|`git.tag`|optional|the git tag name, which to be fetched as source code|
||||
|`src.url`|required|the source code download url of this package.<br>must end with one of `.git` `.zip` `.tar.xz` `.tar.gz` `.tar.lz` `.tar.bz2` `.tgz` `.txz` `.c` `.cc` `.cxx` `.cpp`.<br>also support format like `dir://DIR`|
|`src.sha`|optional|the `sha256sum` of source code.<br>If the value of `src.url` end with `.git`, this key is optional, otherwise, this key must be present.|
||||
|`fix.url`|optional|the patch file download url of this package.<br>must end with one of `.fix` `.diff` `.patch` `.zip` `.tar.xz` `.tar.gz` `.tar.lz` `.tar.bz2` `.tgz` `.txz`|
|`fix.sha`|optional|the `sha256sum` of patch file.|
||||
|`depends`|optional|the packages will be used when installing and runtime. If specify multiple values, separate them with spaces.|
||||
|`cdefine`|optional|append to `CPPFLAGS`|
|`ccflags`|optional|`CFLAGS`|
|`xxflags`|optional|`CXXFLAGS`|
|`ldflags`|optional|`LDFLAGS`|
||||
|`bsystem`|optional|build system.<br>values can be `autogen` `autotools` `configure` `cmake` `cmake-gmake` `cmake-ninja` `meson` `xmake` `gmake` `ninja` `cargo` `go`|
|`bscript`|optional|the build script directory, relative to `PACKAGE_WORKING_DIR` which contains build script such as `configure`, `Makefile`, `CMakeLists.txt`, `meson.build`, `Cargo.toml`, etc.|
|`binbstd`|optional|whether build in build script directory, otherwise build in build directory.|


## the function can be declared in a formula
|function|required?|overview|
|-|-|-|
|`prepare(){}`|optional|this function only run once.|
|`build(){}`|optional|this function only run once. If this function is not declared, we will call default build command according to `bsystem`|

## the function can be invoked in a formula at anywhere
|function|example|
|-|-|
|`echo`|`echo 'your message.'`|
|`info`|`info 'your infomation.'`|
|`warn`|`warn "no package manager found."`|
|`error`|`error 'error message.'`|
|`die`|`die "please specify a package name."`|
|`success`|`success "build success."`|
|`sed_in_place`|`sed_in_place 's/-mandroid//g' Configure`|
|`format_unix_timestamp`|`format_unix_timestamp "$TIMESTAMP_UNIX" '+%Y/%m/%d %H:%M:%S'`|
|`getvalue`|`VALUE=$(getvalue --key=value)`|
|`sha256sum`|`VALUE=$(sha256sum FILEPATH)`|
|`is_sha256sum_match`|`is_sha256sum_match FILEPATH SHA256SUM`|
|`fetch`|`fetch URL [--sha256=SHA256] --output-path=PATH`<br>`fetch URL [--sha256=SHA256] --output-dir=DIR --output-name=NAME`<br>`fetch URL [--sha256=SHA256] --output-dir=DIR [--output-name=NAME]`<br>`fetch URL [--sha256=SHA256] [--output-dir=DIR] --output-name=NAME`|

## the function can be invoked in build function only
|function|example|
|-|-|
|`configure`|`configure --enable-pic`|
|`mesonw`|`mesonw -Dneon=disabled -Darm-simd=disabled`|
|`cmakew`|`cmakew -DBUILD_SHARED_LIBS=ON -DBUILD_STATIC_LIBS=ON`|
|`gmakew`|`gmakew`|
|`cargo`|`cargo`|

## the variable can be used in a formula at anywhere
|variable|overview|
|-|-|
|`NATIVE_OS_TYPE`|current machine os type.|
|`NATIVE_OS_NAME`|current machine os name.|
|`NATIVE_OS_VERS`|current machine os version.|
|`NATIVE_OS_ARCH`|current machine os arch.|
|||
|`MY_VERSION`|the version of `ppkg`.|
|`MY_HOME_DIR`|the home directory of `ppkg`.|
|`MY_HOME_PAGE`|the home webpage of `ppkg`.|
|`MY_CACHED_DIR`|the downloads directory of `ppkg`.|
|`MY_INSTALL_DIR`|the installed directory of `ppkg`.|

## the variable can be used in prepare and build function
|variable|overview|
|-|-|
|`CC`|the C Compiler.|
|`CFLAGS`|the flags of `CC`.|
|`CXX`|the C++ Compiler.|
|`CXXFLAGS`|the flags of `CXX`.|
|`CPP`|the C/C++ PreProcessor.|
|`CPPFLAGS`|the flags of `CPP`.|
|`AS`|the assembler.|
|`AR`|the archiver.|
|`RANLIB`|the archiver extra tool.|
|`LD`|the linker.|
|`LDFLAGS`|the flags of `LD`.|
|`NM`|a command line tool to list symbols from object files.|
|`STRIP`|a command line tool to discard symbols and other data from object files.|
|||
|`TIMESTAMP_UNIX`|the unix timestamp of this installation.|
|||
|`PACKAGE_INSTALLING_TOP_DIR`|the directory used when installing.|
|`PACKAGE_INSTALLING_SRC_DIR`|the directory where the source code tarball uncompressed to or copy to.|
|`PACKAGE_INSTALLING_BST_DIR`|the directory where the build script (`Makefile`, `configure`, `CMakeLists.txt`, `meson.build`, `Cargo.toml`) is located in.|
|`PACKAGE_INSTALLING_TMP_DIR`|the directory where the tmp files are stored in when run build script.|
|||
|`PACKAGE_INSTALL_DIR`|the directory where the output files will be installed to.|
|||
|`x_INSTALL_DIR`|the installation directory of x package.|
|`x_INCLUDE_DIR`|`$x_INSTALL_DIR/include`|
|`x_LIBRARY_DIR`|`$x_INSTALL_DIR/lib`|
