# Raylib Conan Example projects

This repo contains a simple raylib example, and the conan files to build it for different targets.

## Dependencies

You need conan to install the dependencies for this example project, to install conan on fedora linux use:

```bash
sudo yum install pipx
pipx install conan
conan profile detect --force
```

## Build

To build this project use:

```bash
# install dependencies for release
conan install -u -pr:b=default -pr:h=profiles/emscripten.profile --build=missing  --settings=build_type=Release .

# configure cmake
cmake -G Ninja --preset conan-emscripten-release

# build for release
cmake --build --preset conan-emscripten-release
```

The output html, js, and wasm can then be found in `build/emscripten/Release/src`.

# Run

To run the build in your browser use any webserver, I prefer to use caddy:

```bash
caddy file-server --listen localhost:8000 -r build/emscripten/Release/src
```

Then visit the url:

```
http://localhost:8000/raylib_example.html
```
