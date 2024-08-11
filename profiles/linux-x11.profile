[settings]
os=Linux
arch=x86_64
compiler=gcc
compiler.version=13
compiler.cppstd=gnu17
compiler.libcxx=libstdc++11
build_type=Release

[conf]
# This line will make sure that the cmake_layout creates a separate build folders for our linux target
tools.cmake.cmake_layout:build_folder_vars=['settings.os']
