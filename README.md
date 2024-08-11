# Raylib Conan Examples

This repo contains a simple [raylib](https://github.com/raysan5/raylib/) example, and the conan files to build it for different targets.

It shows you how to:
- Use wayland or X11 for desktop builds
- Use emscripten to run your c/c++ game in a web-browser
  - Using a custom html shell template 
  - Embedding external dependencies
- TODO: Use android SKD to compile for smartphones

## Dependencies

You need conan to install the dependencies for this example project, to install conan on fedora linux use:

```bash
sudo yum install pipx
pipx install conan
conan profile detect --force
```

## Building

If you want to run the example app on your local machine, you can run:

```bash
conan install -u -pr:b=default -pr:h=default --build=missing  --settings=build_type=Release .
cmake --build --preset conan-linux-release
./build/linux/Release/src/raylib_example
```

For other platforms you can find more details here:
- Linux X11 or Wayland [readme](README-LINUX.md)
- Web html5 wasm [readme](README-WEB.md)
