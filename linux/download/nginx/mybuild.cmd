#!/usr/bin/env bash

make clean

# Pull the latest code
hg pull
hg update

# Configure
auto/configure --user=www-data --group=www-data --with-cc-opt="-O3 -march=native -mtune=native" \
--conf-path=/etc/nginx/nginx.conf --with-http_ssl_module --with-ipv6 --with-debug --with-http_v2_module

# Build
make

# To install for the first time, run sudo make install
# To upgrade, run sodu make upgrade

