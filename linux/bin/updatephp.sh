#!/usr/bin/env bash

# Default destination directory
OUT_DIR=/usr/local

# parse the arguments
while [[ $# > 1 ]]
do
  opt="$1"
  case $opt in 
    -p|--prefix)
      OUT_DIR="$2"
      shift     # past argument
      ;;
    -i|--input)
      IN_ARCHIVE="$2"
      shift     # past argument
      ;;
    *)
    ;;
  esac
  shift         # past argument
done


cp $IN_ARCHIVE .
tar xzf $IN_ARCHIVE

# bin directory
pushd bin
for f in *
do
  if [ -f ${OUT_DIR}/bin/$f ];
  then
    mv ${OUT_DIR}/bin/$f ${OUT_DIR}/bin/${f}.bak
  fi
  cp -d $f ${OUT_DIR}/bin/$f
done
popd

# sbin directory
pushd sbin
for f in *
do
  if [ -f ${OUT_DIR}/sbin/$f ];
  then
    mv ${OUT_DIR}/sbin/$f ${OUT_DIR}/sbin/${f}.bak
  fi
  cp -d $f ${OUT_DIR}/sbin/$f
done
popd

# lib directory
test -d ${OUT_DIR}/lib/php || mkdir -p ${OUT_DIR}/lib/php
pushd lib/php
for f in *
do
  echo "Processing $f file ..."
  if [ -d $f ]; then    # directory
    if [ -d ${OUT_DIR}/lib/php/$f ]; then
      mv ${OUT_DIR}/lib/php/$f ${OUT_DIR}/lib/php/${f}.bak
    fi
    cp -r $f ${OUT_DIR}/lib/php/$f
  else  # file
    if [ -f ${OUT_DIR}/lib/php/$f ]; then
      mv ${OUT_DIR}/lib/php/$f ${OUT_DIR}/lib/php/${f}.bak
    fi
    cp -d $f ${OUT_DIR}/lib/php/$f
  fi
done
popd


# include directory
test -d ${OUT_DIR}/include/php || mkdir -p ${OUT_DIR}/include/php
pushd include/php
for f in *
do
  echo "Processing $f file ..."
  if [ -d $f ]; then    # directory
    if [ -d ${OUT_DIR}/include/php/$f ]; then
      mv ${OUT_DIR}/include/php/$f ${OUT_DIR}/include/php/${f}.bak
    fi
    cp -r $f ${OUT_DIR}/include/php/$f
  else  # file
    if [ -f ${OUT_DIR}/include/php/$f ]; then
      mv ${OUT_DIR}/include/php/$f ${OUT_DIR}/include/php/${f}.bak
    fi
    cp -d $f ${OUT_DIR}/include/php/$f
  fi
done
popd


