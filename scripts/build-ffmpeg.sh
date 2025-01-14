#!/bin/bash
### https://ffmpeg.org/download.html
## git clone https://git.ffmpeg.org/ffmpeg.git ffmpeg

cd $HOME/github/ffmpeg
make clean &&
./configure \
	--cc=clang \
	--cxx=clang++ \
	--pkg-config-flags="--static" \
	--extra-libs="-lpthread -lm" \
	--enable-openssl \
	--enable-gpl \
	--enable-nonfree \
	--enable-libdrm \
	--enable-libaom \
	--enable-libass \
	--enable-libfreetype \
	--enable-libmp3lame \
	--enable-libvpx \
	--enable-libx264 \
	--enable-libx265 \
	--enable-vulkan && \
make -j14
#sudo make install
