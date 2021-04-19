#!/bin/bash

set -ex
set -o pipefail

scriptdir="$(cd "$(dirname "$0")" && pwd)"

prefixpath="$scriptdir/build/instprefix"



# build the library
cd "$scriptdir"
rm -rf build

cmake -S .. -B build/lib
cd build/lib
cmake --build . --config Release
cmake --build . --config Debug
cmake --install . --config Release --prefix "$prefixpath"
cmake --install . --config Debug --prefix "$prefixpath"


# build the test program
cd "$scriptdir"

cmake -S . -B build/test "-DCMAKE_PREFIX_PATH=$prefixpath"
cd build/test
cmake --build . --config Debug
./Debug/nanosvg-test

cmake --build . --config Release
./Release/nanosvg-test

echo "All Good."
