summary: Graph visualization software from AT&T and Bell Labs
webpage: https://www.graphviz.org
git-url: https://gitlab.com/graphviz/graphviz.git
src-url: https://gitlab.com/api/v4/projects/4207231/packages/generic/graphviz-releases/3.0.0/graphviz-3.0.0.tar.xz
src-sha: ddda3cd0e9bc60c9fb56b4bf4a02eb60ecbfb4405c6758553f7d2668633b4262
dep-pkg: fontconfig libpng expat libtool python3 flex bison git awk
license: EPL-1.0

bsystem: autotools
install: configure --enable-swig=no
