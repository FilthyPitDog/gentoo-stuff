#!/bin/bash
## https://github.com/mltframework/mlt

cd $HOME/github/mlt
rm -rf build && mkdir -pv build && cd build
cmake ../ &&
cmake --build . -j14
# sudo cmake --install .
