# Raylib in the browser!

Raylib games written in C or C++ can be played inside a webbrowser by crosscompiling them to WASM.
Conan makes this process fairly simple.
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
