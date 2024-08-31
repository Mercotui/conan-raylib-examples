from conan import ConanFile
from conan.tools.cmake import cmake_layout


class RaylibWasm(ConanFile):
    settings = "os", "compiler", "build_type", "arch"
    generators = "CMakeDeps", "CMakeToolchain"

    def requirements(self):
        # Raylib 5.0 is compatible with Android NDK version 26 or older, support for version 27 was first merged here:
        # https://github.com/raysan5/raylib/commit/3079c69725b3e4f07f6984dc2f67262bba48b153
        # This fix should be included in the next raylib release, version 5.5.
        self.requires("raylib/5.0")

    def layout(self):
        cmake_layout(self)
