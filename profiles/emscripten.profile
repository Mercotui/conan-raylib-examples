[settings]
os=Emscripten
arch=wasm
compiler=clang
compiler.version=18
compiler.libcxx=libc++
compiler.cppstd=23
build_type=Release

[tool_requires]
emsdk/3.1.50

[conf]
# This line will make sure that the cmake_layout creates a separate build folder for our emscripten target
tools.cmake.cmake_layout:build_folder_vars=['settings.os']
