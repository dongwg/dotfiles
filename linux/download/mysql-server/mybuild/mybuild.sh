#!/usr/bin/env bash

rm -f CMakeCache.txt

cmake .. -DDOWNLOAD_BOOST=1 -DWITH_BOOST=/home/taohe/DevUtils -DCMAKE_INSTALL_PREFIX=/usr/local/mysql-5.7 -DWITH_SYSTEMD=ON -DMYSQL_DATADIR=/var/lib/mysql -DSYSCONFDIR=/etc 

make

