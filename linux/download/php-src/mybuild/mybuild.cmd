#!/bin/bash

make distclean

# git pull origin master

pushd ..
./buildconf --force
popd

../configure --prefix=/usr/local --sysconfdir=/etc --localstatedir=/var --datadir=/usr/share/php --mandir=/usr/share/man --enable-fpm --with-fpm-user=www-data --with-fpm-group=www-data --with-config-file-path=/etc --with-zlib --enable-bcmath --with-bz2 --enable-calendar --disable-dba --with-gmp --enable-ftp --with-gettext --enable-mbstring --with-readline --disable-fileinfo --enable-maintainer-zts --with-mysqli --with-pdo-mysql --with-mysql --with-qd --with-openssl --without-pear --enable-zip --with-curl --with-freetype-dir=/usr/local/freetype2 --enable-gd-native-ttf --with-fpm-systemd '--enable-opcache' '--enable-opcache-file'

make

# To upgrade the existing installation, run sudo make install


