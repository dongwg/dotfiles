#!/bin/sh

git pull origin master

cd mybuild_x86_64
make distclean

../configure --prefix=$LOCALDESTDIR --disable-shared --enable-static

make
make install
cd ..

