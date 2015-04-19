#!/bin/sh

# Get the latest code
git checkout master
git pull origin master
git checkout mybuild
git rebase master

# Change to the build directory
cd mybuild_x86_64

# Clean the previous build
make distclean

# Run the configure again
../configure --prefix=$LOCALDESTDIR --enable-static --disable-shared --without-python


# Build 
make

# Install
make install

# Return to the directory
cd ..



