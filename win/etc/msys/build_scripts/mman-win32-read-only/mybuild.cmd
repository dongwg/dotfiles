#!/bin/sh

# Get the latest code
snv update

# Clean the previous build
make clean

# Run the configure again
../configure --prefix=$LOCALDESTDIR --enable-static --libdir=${LOCALDESTDIR}/lib --incdir=${LOCALD ESTDIR}/include/sys 

# Build 
make

# Install
make install

