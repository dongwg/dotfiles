#!/usr/bin/env bash


make clean
rm -f CMakeCache.txt

cmake .. -DDOWNLOAD_BOOST=1 -DWITH_BOOST=/home/taohe/DevUtils -DCMAKE_INSTALL_PREFIX=/usr/local/mysql-5.7 -DWITH_SYSTEMD=ON -DMYSQL_DATADIR=/var/lib/mysql -DSYSCONFDIR=/etc 

make

# To install in the first time, run sudo make install
# To upgrade the existing installation after building with 
# the latest source code, run sudo make install. 
# NB: Running make install will overwrite the existing binaries. 
# 
