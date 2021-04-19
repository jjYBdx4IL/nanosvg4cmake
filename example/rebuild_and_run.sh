#!/bin/bash

set -ex
set -o pipefail

scriptdir="$(cd "$(dirname "$0")" && pwd)"

cd "$scriptdir"
rm -rf build

cmake -S . -B build -DBUILD_DEPS_ONLY=1
cd build
cmake --build . --config Debug

cmake . -DBUILD_DEPS_ONLY=0
cmake --build . --config Debug

cd ..

./build/Debug/example2

# example1 needs an OpenGL-capable display
if [[ -z "$CI" ]] && [[ -n "$DISPLAY" ]]; then
    ./build/Debug/example1
fi

echo All Good.

