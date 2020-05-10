#!/bin/sh

./configure --with-features=huge \
        --enable-multibyte \
        --enable-largefile \
        --enable-rubyinterp=yes \
        --enable-pythoninterp=yes \
        --with-python-config-dir=$(python-config --configdir) \
        --enable-python3interp=yes \
        --with-python3-config-dir=$(python3-config --configdir) \
        --enable-perlinterp=yes \
        --enable-luainterp=yes \
        --enable-cscope \
        --prefix=/usr/local

make VIMRUNTIMEDIR=/usr/local/share/vim/vim81
