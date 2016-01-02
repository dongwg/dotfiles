#!/usr/bin/env bash

# parse the arguments
while [[ $# > 1 ]]
do
  opt="$1"
  case $opt in 
    -p|--prefix)
      PHP_ROOT="$2"
      shift     # past argument
      ;;
    *)

    ;;
  esac
  shift         # past argument
done

cp -r ${PHP_ROOT}/bin bin
cp -r ${PHP_ROOT}/include include
cp -r ${PHP_ROOT}/lib lib
cp -r ${PHP_ROOT}/sbin sbin

tar czf phpbin.tar.gz bin include lib sbin

