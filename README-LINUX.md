# Installing Raylib on Wayland and X11

To use conan to install raylib on wayland and X11, I had to modify the raylib conanfile,
that work is pending upstreamification:
https://github.com/conan-io/conan-center-index/pull/24890

## Build X11

To verify the working of raylib on X11 I had to create a container image capable of building and running X11
applications. If you have X11 on your local machine then skip this step, but if you want to run this container image,
then use the following commands:

```bash
podman build containers/ -f x11-vnc.containerfile
podman run -ti -p 5900:5900 -v=${PWD}:/workspace:Z c41cf98c1583
```

Note that `c41cf98c1583` is the resulting container ID of your build command, this may vary.
Now that the container is running, you should be able to log into it with a vnc client on the URL `vnc://localhost:5900`.

Then to build and run the raylib example you can use:

```bash
cd workspace
conan install -u -pr:b=profiles/linux-x11.profile -pr:h=profiles/linux-x11.profile --build=missing  --settings=build_type=Release .
cmake --build --preset conan-linux-release
./build/linux/Release/src/raylib_example
```

## Build Wayland

If you use wayland on your system, then you can use the following commands to build and run:

```bash
cd workspace
conan install -u -pr:b=profiles/linux-wayland.profile -pr:h=profiles/linux-wayland.profile --build=missing  --settings=build_type=Release .
cmake --build --preset conan-linux-release
./build/linux/Release/src/raylib_example
```
