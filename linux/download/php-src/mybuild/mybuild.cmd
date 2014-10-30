#!/bin/bash

make distclean

git pull

../configure --prefix=/usr/local --sysconfdir=/etc --localstatedir=/var --datadir=/usr/share/php --mandir=/usr/share/man --enable-fpm --with-fpm-user=www-data --with-fpm-group=www-data --with-config-file-path=/etc --with-zlib --enable-bcmath --with-bz2 --enable-calendar --disable-dba --with-gmp --enable-ftp --with-gettext --enable-mbstring --with-readline --disable-fileinfo --enable-maintainer-zts

make


