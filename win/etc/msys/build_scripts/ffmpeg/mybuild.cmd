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
../configure --prefix=$LOCALDESTDIR --enable-static --disable-shared --extra-cflags="-mms-bitfields -O3 -march=native" --extra-ldflags="-Wl,-add-stdcall-alias -flto -s -L${LOCALDESTDIR}/lib" --enable-memalign-hack --extra-libs="-lssl -lcrypto -lcurl -lssl -lcrypto -llua -lwldap32 -lz -ldxguid -lwinmm -lws2_32 -lgdi32 -lstdc++" --enable-libx264 --enable-libmp3lame --enable-gpl --enable-version3 --enable-nonfree --enable-libbluray --enable-libx265 --enable-pthreads --disable-w32threads --disable-os2threads --enable-librtmp --enable-libquvi --enable-openssl --cpu=corei7 --enable-dxva2 --enable-decoder=h264 --enable-hwaccel=h264_dxva2

#../configure --prefix=$LOCALDESTDIR --enable-static --disable-shared --extra-cflags="-mms-bitfields -Os -Ofast -flto -march=native -funroll-loops" --extra-ldflags="-Wl,-add-stdcall-alias -flto -s" --enable-memalign-hack --extra-libs="-ldxguid -lwinmm" --enable-libx264 --enable-libmp3lame --enable-pthreads --enable-gpl --enable-nonfree --enable-dxva2 --enable-decoder=h264 --enable-hwaccel=h264_dxva2 --disable-runtime-cpudetect

# Build 
make

# Install
make install

# Return to the directory
cd ..

