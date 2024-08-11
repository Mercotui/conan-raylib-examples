[settings]
os=Linux
arch=x86_64
compiler=gcc
compiler.version=13
compiler.cppstd=gnu17
compiler.libcxx=libstdc++11
build_type=Release

[options]
# These options configure the conan recipes for glfw and xkbcommon:
# https://github.com/conan-io/conan-center-index/blob/master/recipes/glfw/all/conanfile.py
# https://github.com/conan-io/conan-center-index/blob/master/recipes/xkbcommon/all/conanfile.py
glfw/*:with_x11=False
glfw/*:with_wayland=True
xkbcommon/*:with_x11=False
xkbcommon/*:with_wayland=True

[conf]
# This line will make sure that the cmake_layout creates a separate build folders for our linux target
tools.cmake.cmake_layout:build_folder_vars=['settings.os']
