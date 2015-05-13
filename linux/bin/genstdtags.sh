#!/bin/sh

# check the directory of tags
if [ ! -d /vega/xp/dev/wdong/tags ]; then
  mkdir -p /vega/xp/dev/wdong/tags
fi

if [ -f /vega/xp/dev/wdong/tags/cpp.tags ]; then
  rm -rf /vega/xp/dev/wdong/tags/cpp.tags
fi

GCC_VERSION=`gcc -v 2>&1 | tail -1 | awk '{print $3}'`
if [ ! -d /vega/xp/dev/wdong/tags/cpp_src ]; then
  cp -L -R /usr/include/c++/$GCC_VERSION /vega/xp/dev/wdong/tags/cpp_src
  # it is not necessary to rename headers without an extension
  # replace the "namespace std _GLIBCXX_VISIBILITY(default)" with "namespace std"
  find /vega/xp/dev/wdong/tags/cpp_src -type f | xargs sed -i 's/namespace std _GLIBCXX_VISIBILITY(default)/namespace std/'
fi

ctags -f /vega/xp/dev/wdong/tags/cpp.tags -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -I _GLIBCXX_NOEXCEPT /vega/xp/dev/wdong/tags/cpp_src

# GL
if [ -f /vega/xp/dev/wdong/tags/gl.tags ]; then
  rm -rf /vega/xp/dev/wdong/tags/gl.tags
fi
ctags -f /vega/xp/dev/wdong/tags/gl.tags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ /usr/include/GL/ 

# QT4 
if [ -f /vega/xp/dev/wdong/tags/qt4.tags ]; then
  rm -rf /vega/xp/dev/wdong/tags/qt4.tags
fi
ctags -f /vega/xp/dev/wdong/tags/qt4.tags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ /vega/xp/ThirdParty/QT4/${MACHINE}/xprel/include/

