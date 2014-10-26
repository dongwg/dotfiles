#!/bin/bash


hg pull
hg update

make clean

auto/configure --user=www-data \
--group=www-data \
--with-cc-opt="-O3 -march=native -mtune=native" \
--conf-path=/etc/nginx/nginx.conf \
--with-http_ssl_module \
--with-ipv6 

make


