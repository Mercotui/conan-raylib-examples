from conan import ConanFile
from conan.tools.cmake import cmake_layout


class RaylibWasm(ConanFile):
    settings = "os", "compiler", "build_type", "arch"
    generators = "CMakeDeps", "CMakeToolchain"

    def requirements(self):
        # Custom conan recipe, pending upstreaming:
        # https://github.com/Mercotui/conan-center-index/commit/ca075135a372741ca702c82326e2c927fa12c463
        self.requires("raylib/5.0#3ba2ff34f19ef878e919de87156da5a1")

    def layout(self):
        cmake_layout(self)
