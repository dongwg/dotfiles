#!/bin/sh

git pull origin master

cd mybuild_x86_64
make distclean

../configure --prefix=$LOCALDESTDIR --disable-shared --build=x86_64 --disable-asm

make
make install
cd ..

