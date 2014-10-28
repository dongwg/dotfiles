#!/bin/bash

make distclean

git pull

CFLAGS="-O3 -march=native -mtune=native" CPPFLAGS="-O3 -march=native -mtune=native" ../configure --bindir=/usr/bin

make

