#!/bin/bash

if [[ -d output ]]; then
	rm -rf output
fi

GENERATOR_UNIX="Unix Makefiles"
GENERATOR_NINJA="Ninja"

cmake -S . -B output \
	-DCMAKE_TOOLCHAIN_FILE=cmake/gcc-arm-none-eabi.cmake \
	-DCMAKE_BUILD_TYPE=Debug -G "${GENERATOR_NINJA}"

cmake --build output -j8
