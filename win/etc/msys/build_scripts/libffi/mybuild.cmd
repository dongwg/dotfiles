#!/bin/sh

git pull origin master

cd mybuild_x86_64
make distclean

../configure --prefix=$LOCALDESTDIR --disable-shared --enable-static --with-gcc-arch=native --bui ld=x86_64-pc-mingw32

make
make install
cd ..

