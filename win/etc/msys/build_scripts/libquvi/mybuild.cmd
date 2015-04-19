#!/bin/sh

git checkout master
git pull origin master
git checkout mybuild
git rebase master

cd mybuild_x86_64
make distclean
rm -rf /local64/include/quvi-0.9/quvi

CFLAGS="-DCURL_STATICLIB" LDFLAGS="-Wl,--allow-multiple-definition" LIBS="-lstdc++" ../configure --prefix=$LOCALDESTDIR --disable-shared --enable-static --without-manual --build=x86_64-w64-mingw32

make
make install
cd ..

