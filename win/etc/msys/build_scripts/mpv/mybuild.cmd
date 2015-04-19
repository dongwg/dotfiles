#!/bin/sh

git checkout master
git pull origin master
git checkout mydev
git rebase master

make distclean
#./myold-configure --enable-static --extra-cflags="-Os" --extra-libs="-ldxguid -lwinmm -L${LOCALDESTDIR}/lib -lbluray -lgcrypt -lgpg-error -lproxy -lmodman -lglib-2.0 -lintl" --extra-ldflags="-s -flto" --enable-bluray --disable-lua --disable-libquvi9 --enable-libquvi4
./myold-configure --enable-static --extra-cflags="-O3 -D_WIN32_WINNT=0x600 -DUNICODE -DCOBJMACROS" --extra-libs="-municode -ldxguid -lwinmm -L${LOCALDESTDIR}/lib -lbluray -lgcrypt -lgpg-error -lproxy -lmodman -lglib-2.0 -lintl" --extra-ldflags="-s -flto" --enable-bluray 
make

