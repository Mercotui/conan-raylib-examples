find_package(raylib 5.0 REQUIRED)

if (ANDROID)
    # Android doesn't want an executable, but instead a library that can be dynamically loaded
    add_library(raylib_example SHARED)
    target_include_directories(raylib_example PRIVATE ${ANDROID_NDK_ROOT}/sources/)
else ()
    # All other platforms can directly run an executable
    add_executable(raylib_example)
endif ()

# The main.cpp file is used by all our platforms
target_sources(raylib_example PRIVATE main.cpp)

if (ANDROID)
    # The functions (symbols) in native app glue are used by android at runtime
    target_sources(raylib_example PRIVATE ${ANDROID_NDK_ROOT}/sources/android/native_app_glue/android_native_app_glue.c)
    # We use -u to tell the linker to keep this symbol, it is only used dynamically at runtime, and LinkTimeOptimization
    # would otherwise strip it out of our binary. That results in the app "crashing" on startup.
    target_link_options(raylib_example PUBLIC -u ANativeActivity_onCreate)

    # Android has a few extra libraries that we need to link, I got this list of libraries from this wiki entry,
    # stripping away what I did not need:
    #  https://github.com/raysan5/raylib/wiki/Working-for-Android-(on-Linux)#build
    target_link_libraries(raylib_example PRIVATE log android EGL GLESv2)
elseif (EMSCRIPTEN)
    # Feel free to use another compile definition, that's just user defined
    target_compile_definitions(raylib_example PRIVATE PLATFORM_WEB)

    # The linker options were strongly recommended here:
    #   https://github.com/raysan5/raylib/wiki/Working-for-Web-(HTML5)
    #
    # Shell customization is documented here:
    #   https://emscripten.org/docs/compiling/Deploying-Pages.html#build-files-and-custom-shell
    # Note that cmake does not understand our dependency on custom_shell.html, so you have to do a clean build if you
    # change the shell. This could probably be solved by using add_custom_command, but I don't really know/care.
    #
    # Resource embedding is documented here:
    #   https://emscripten.org/docs/porting/files/packaging_files.html
    target_link_options(raylib_example PRIVATE
            -sUSE_GLFW=3
            -sASSERTIONS=1
            -sWASM=1
            -sASYNCIFY=1
            # TODO(Menno 02.06.2024) This option is introduced emsdk 3.1.51 which is not available yet in conan-center.
            #  I'll update it someday if I get access to upstream stuff into conan-center
            # -sGL_ENABLE_GET_PROC_ADDRESS=1
            --shell-file ${CMAKE_CURRENT_SOURCE_DIR}/custom_shell.html
            --embed-file ${CMAKE_CURRENT_SOURCE_DIR}/velperpoort_cat.png@cat.png
        )

    # Tell emc++ that we want to output a fully working website, this is the recommended build mode:
    #   https://emscripten.org/docs/compiling/Deploying-Pages.html#build-files-and-custom-shell
    set_target_properties(raylib_example PROPERTIES SUFFIX ".html")
else ()
    # In this case "else" implies we are targeting desktop.
    configure_file(velperpoort_cat.png cat.png COPYONLY)
endif ()

# We link to raylib on every platform, ofcourse.
target_link_libraries(raylib_example PRIVATE raylib)
