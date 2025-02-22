#!/bin/bash
## https://github.com/mpv-player/mpv

cd $HOME/github/mpv
rm -rf build
meson \
	-Dlua=luajit \
	-Djavascript=disabled \
	-Dwayland=disabled \
	-Dvdpau=disabled \
	-Djack=disabled \
	-Dgbm=disabled \
	-Degl=disabled \
	-Degl-drm=disabled \
	-Degl-x11=disabled \
	-Dshaderc=enabled \
	-Dvaapi=enabled \
	-Dvaapi-drm=enabled \
	-Dvaapi-x11=enabled \
	-Ddrm=enabled \
	-Dpipewire=enabled \
	-Dvulkan=enabled \
	-Dgl=enabled \
	-Dgl-x11=enabled \
	-Dx11=enabled \
	-Dlibplacebo=enabled \
	-Dbuild-date=true \
	-Dsdl2=disabled \
	-Dlibarchive=enabled \
	-Dmanpage-build=disabled \
	-Dhttps://=enabled build && \
meson compile -C build
## sudo meson install -C build
## -Dprefix=/usr/local
