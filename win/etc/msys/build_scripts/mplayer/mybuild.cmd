#!/bin/sh

svn update
make distclean

./configure --enable-static
make

