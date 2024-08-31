# Raylib Conan Examples

This repo contains a simple [raylib](https://github.com/raysan5/raylib/) example, and the conan files to build it for
different targets.

It shows you how to:

- Use wayland or X11 for desktop builds
- Use emscripten to run your c/c++ game in a web-browser
    - Using a custom html shell template
    - Embedding external dependencies
- Use android for basic smartphone development
  - Compile your code using the conan NDK package
  - Use the SDK to build an APK for testing

You need [conan](https://docs.conan.io/2/installation.html) to install the dependencies for this example project,
to install conan on fedora linux use:

```bash
sudo yum install pipx
pipx install conan
conan profile detect --force
```

If you want to run the example app on your local machine, you can run:

```bash
conan install -u -pr:b=default -pr:h=default --build=missing  --settings=build_type=Release .
cmake --build --preset conan-linux-release
./build/linux/Release/src/raylib_example
```

For other platforms you can find more details here:

- Linux X11 or Wayland [readme](README-LINUX.md)
- Web html5 wasm [readme](README-WEB.md)
- Android [readme](README-ANDROID.md)

Conan supports many more operating systems, see
[this overview](https://docs.conan.io/2/reference/config_files/settings.html#operating-systems).
Raylib also supports a few more platforms such as MS Windows, Apple macOS and FreeBSD, see more instructions
[here](https://github.com/raysan5/raylib/?tab=readme-ov-file#installing-and-building-raylib-on-multiple-platforms).
I have not tested those platforms, but the
[conan recipe](https://github.com/conan-io/conan-center-index/blob/master/recipes/glfw/all/conanfile.py)
for GLFW seems to support them.

Apple iOS is [not (yet) supported](https://github.com/raysan5/raylib/pull/3880) by raylib. If it were supported it would
require a macOS pc to install Xcode, which is prohibitively expensive. If you don't happen to own a Mac, I would
personally recommend skipping native iOS support and using html5 WASM instead, although even that seems problematic with
Safari.
