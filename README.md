# ppkg-formula-repository-offical-core
the offical formula repository for [ppkg](https://github.com/leleliu008/ppkg)

## ppkg formula
a ppkg formula is a [YAML](https://yaml.org/spec/1.2.2/) format file which is used to config a ppkg package's meta-infomation including one sentence description, package version, installation instructions, etc.

## ppkg formula scheme
|KEY|required?|overview|
|-|-|-|
|`summary`|required|Describe this package in one sentence.|
|`license`|optional|a space-separated list of [SPDX license short identifiers](https://spdx.github.io/spdx-spec/v2.3/SPDX-license-list/#a1-licenses-with-short-identifiers)|
|`version`|optional|the version of this package.<br>If this mapping is not present, it will be calculated from `src-url`, if `src-url` is also not present, it will be calculated from running time as format `date +%Y.%m.%d`|
||||
|`web-url`|optional|the home webpage of this package.<br>If this mapping is not present, `git-url` must be present.|
||||
|`git-url`|optional|the source code git repository.<br>If `src-url` is not present, this mapping must be present.|
|`git-ref`|optional|reference: https://git-scm.com/book/en/v2/Git-Internals-Git-References <br>example values: `HEAD` `refs/heads/master` `refs/heads/main` `refs/tags/v1`, default value is `HEAD`|
|`git-sha`|optional|the full git commit id, 40-byte hexadecimal string, if `git-ref` and `git-sha` both are present, `git-sha` takes precedence over `git-ref`|
|`git-nth`|optional|tell `ppkg` that how many depth commits would you like to be fetched. default is `1`, this would save your time and storage. If you want to fetch all commits, set this to `0`|
||||
|`src-url`|optional|the source code download url of this package.<br>If value of this mapping ends with one of `.zip` `.tar.xz` `.tar.gz` `.tar.lz` `.tar.bz2` `.tgz` `.txz` `.tlz` `.tbz2`, it will be uncompressed to `$PACKAGE_WORKING_DIR/src` when this package is installing, otherwise, it will be copied to `$PACKAGE_WORKING_DIR/src`<br>also support format like `dir://DIR`|
|`src-uri`|optional|the mirror of `src-url`.|
|`src-sha`|optional|the `sha256sum` of source code.<br>`src-sha` and `src-url` must appear together.|
||||
|`fix-url`|optional|the patch file download url of this package.<br>If value of this mapping ends with one of `.zip` `.tar.xz` `.tar.gz` `.tar.lz` `.tar.bz2` `.tgz` `.txz` `.tlz` `.tbz2`, it will be uncompressed to `$PACKAGE_WORKING_DIR/fix` when this package is installing, otherwise, it will be copied to `$PACKAGE_WORKING_DIR/fix`.|
|`fix-sha`|optional|the `sha256sum` of patch file.<br>`fix-sha` and `fix-url` must appear together.|
||||
|`res-url`|optional|other resource download url of this package.<br>If value of this mapping ends with one of `.zip` `.tar.xz` `.tar.gz` `.tar.lz` `.tar.bz2` `.tgz` `.txz` `.tlz` `.tbz2`, it will be uncompressed to `$PACKAGE_WORKING_DIR/res` when this package is installing, otherwise, it will be copied to `$PACKAGE_WORKING_DIR/res`.|
|`res-sha`|optional|the `sha256sum` of resource file.<br>`res-sha` and `res-url` must appear together.|
||||
|`dep-pkg`|optional|a space-separated list of   `ppkg packages` that are depended by this package when installing and/or runtime, which will be installed via [ppkg](https://github.com/leleliu008/ppkg).|
|`dep-upp`|optional|a space-separated list of   `uppm packages` that are depended by this package when installing and/or runtime, which will be installed via [uppm](https://github.com/leleliu008/uppm).|
|`dep-pym`|optional|a space-separated list of `python packages` that are depended by this package when installing and/or runtime, which will be installed via [pip3](https://github.com/pypa/pip).|
|`dep-plm`|optional|a space-separated list of    `perl modules` that are depended by this package when installing and/or runtime, which will be installed via [cpan](https://metacpan.org/dist/CPAN/view/scripts/cpan).|
||||
|`cdefine`|optional|append to `CPPFLAGS`|
|`ccflags`|optional|append to `CFLAGS`|
|`xxflags`|optional|append to `CXXFLAGS`|
|`ldflags`|optional|append to `LDFLAGS`|
||||
|`bsystem`|optional|build system name.<br>values can be some of `autogen` `autotools` `configure` `cmake` `cmake-gmake` `cmake-ninja` `meson` `xmake` `gmake` `ninja` `cargo` `go`|
|`bscript`|optional|the directory where the build script is located in, relative to `PACKAGE_WORKING_DIR`. build script such as `configure`, `Makefile`, `CMakeLists.txt`, `meson.build`, `Cargo.toml`, etc.|
|`binbstd`|optional|whether to build in the directory where the build script is located in, otherwise build in other directory. value shall be `0` or `1`. default value is `0`.|
|`dopatch`|optional|POSIX shell code to be run before `install`. `pwd` is `$PACKAGE_BSCRIPT_DIR`|
|`install`|optional|POSIX shell code to be run when user run `ppkg install <PKG>`. If this mapping is not present, `ppkg` will run default install code according to `bsystem`|
|`symlink`|optional|whether to symlink installed files to `$PPKG_HOME/symlinked/*`. value shall be `0` or `1`. default value is `1`.|
|`sfslink`|optional|whether to support fully statically linked executables. value shall be `0` or `1`. default value is `1`. If `0` is given, `ppkg` would not add `--static` and `-static` options to `LDFLAGS` even if `--link-type=static-fully` install option is given.|

### Appendix1: commands that can be invoked in prepare and install block
|command|usage-example|
|-|-|
|`echo`|`echo 'your message.'`|
|`info`|`info 'your infomation.'`|
|`warn`|`warn "no package manager found."`|
|`error`|`error 'error message.'`|
|`die`|`die "please specify a package name."`|
|`success`|`success "build success."`|
|`sed_in_place`|`sed_in_place 's/-mandroid//g' Configure`|
|`format_unix_timestamp`|`format_unix_timestamp "$TIMESTAMP_UNIX" '+%Y/%m/%d %H:%M:%S'`|
|`wfetch`|`wfetch URL [--sha256=SHA256] --output-path=PATH`<br>`wfetch URL [--sha256=SHA256] --output-dir=DIR --output-name=NAME`<br>`wfetch URL [--sha256=SHA256] --output-dir=DIR [--output-name=NAME]`<br>`wfetch URL [--sha256=SHA256] [--output-dir=DIR] --output-name=NAME`|

### Appendix2: commands that can be invoked in install block only
|command|usage-example|
|-|-|
|`configure`|`configure --enable-pic`|
|`mesonw`|`mesonw -Dneon=disabled -Darm-simd=disabled`|
|`cmakew`|`cmakew -DBUILD_SHARED_LIBS=ON -DBUILD_STATIC_LIBS=ON`|
|`gmakew`|`gmakew`|
|`xmakew`|`xmakew`|
|`cargow`|`cargow`|
|`gow`|`gow`|

### Appendix3: shell variables can be used in prepare and install block
|variable|overview|
|-|-|
|`TIMESTAMP_UNIX`|the unix timestamp of this action.|
|||
|`NATIVE_OS_KIND`|current machine os kind.|
|`NATIVE_OS_TYPE`|current machine os type.|
|`NATIVE_OS_NAME`|current machine os name.|
|`NATIVE_OS_VERS`|current machine os version.|
|`NATIVE_OS_ARCH`|current machine os arch.|
|`NATIVE_OS_NCPU`|current machine os's cpu core count.|
|||
|`TARGET_OS_KIND`|os kind that is built for.|
|`TARGET_OS_TYPE`|os type that is built for.|
|`TARGET_OS_VERS`|os vers that is built for.|
|`TARGET_OS_ARCH`|os arch that is built for.|
|`TARGET_OS_LIBC`|os libc that is built with.|
|||
|`CROSS_COMPILING`|value shall be 0 or 1. indicates whether is cross-compiling.|
|||
|`PPKG_VERSION`|the version of `ppkg`.|
|`PPKG_HOME`|the home directory of `ppkg`.|
|`PPKG`|the executable filepath of `ppkg`.|
|||
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
|`PACKAGE_WORKING_DIR`|the working directory when installing.|
|`PACKAGE_BSCRIPT_DIR`|the directory where the build script (e.g. `Makefile`, `configure`, `CMakeLists.txt`, `meson.build`, `Cargo.toml`, etc) is located in.|
|`PACKAGE_BCACHED_DIR`|the directory where the temporary files are stored in when building.|
|`PACKAGE_INSTALL_DIR`|the directory where the final files will be installed to.|
|||
|`x_INSTALL_DIR`|the installation directory of x package.|
|`x_INCLUDE_DIR`|`$x_INSTALL_DIR/include`|
|`x_LIBRARY_DIR`|`$x_INSTALL_DIR/lib`|
