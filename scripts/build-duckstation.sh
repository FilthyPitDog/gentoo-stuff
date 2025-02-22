#!/bin/bash
## https://github.com/stenzek/duckstation

cd $HOME/github/duckstation
rm -rf build-release && mkdir -pv build-release
cmake -Bbuild-release -DCMAKE_BUILD_TYPE=Release -GNinja &&
cmake --build build-release --parallel