#!/bin/sh

# Get the latest code
git pull origin master

# Change to the build directory
cd mybuild_x86_64

# Clean the previous build
make distclean

# Run the configure again
../configure --prefix=$LOCALDESTDIR --enable-static --host=x86_64-pc-mingw32 --enable-win32thread --extra-cflags="-O3 -march=native"
 

# Build 
make

# Install
make install

# Return to the directory
cd ..



