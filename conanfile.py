from conan import ConanFile
from conan.tools.cmake import cmake_layout


class RaylibWasm(ConanFile):
    settings = "os", "compiler", "build_type", "arch"
    generators = "CMakeDeps", "CMakeToolchain"

    def requirements(self):
        self.requires("raylib/5.0")

    def layout(self):
        cmake_layout(self)
