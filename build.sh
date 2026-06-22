#!/bin/bash

if [[ -d build ]]; then
	cmake --build build --target clean
fi

GENERATOR_UNIX="Unix Makefiles"
GENERATOR_NINJA="Ninja"

cmake -S . -B build \
	-DCMAKE_TOOLCHAIN_FILE=cmake/gcc-arm-none-eabi.cmake \
	-DCMAKE_BUILD_TYPE=Debug -G "${GENERATOR_NINJA}"

cmake --build build -j8