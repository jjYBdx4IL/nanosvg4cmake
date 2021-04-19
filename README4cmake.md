
# nanosvg 4 cmake

[![Build Status](https://travis-ci.com/jjYBdx4IL/nanosvg4cmake.png?branch=master)](https://travis-ci.com/jjYBdx4IL/nanosvg4cmake)

Tested on Windows 10 (amd64), Ubuntu (amd64), OSX. Click build status icon above for details.

Look at cmake-test/ or example/ to see how to build and/or use.

Only multi-config build systems are supported (Ninja Multi-Config, MSVC, Xcode, *not* Unix Makefiles or Ninja).

It's possible to run the BASH scripts under Cygwin on Windows. Append `export PATH=/cygdrive/c/Program\ Files/CMake/bin:$PATH` to your `~/.bashrc` and [install CMake for Windows](https://cmake.org/download/). That will build using MSVC. If you want to build using GCC, leave the PATH variable alone, install cmake via cygwin package manager, and append `export CMAKE_GENERATOR="Ninja Multi-Config"` to your `~/.bashrc`. Both variants work. The latter one obviously needs the Cygwin X server up and running.

