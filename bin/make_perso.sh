#!/usr/bin/bash
mkdir -p "./build/"
# cmake --build build --parallel "$(nproc)"

# old version :
# [ -d "./build" ] || mkdir ./build/ 
# cd "./build/" && make -j "$(nproc)" && cd "-" || exit