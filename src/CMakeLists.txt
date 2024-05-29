find_package(raylib 5.0 REQUIRED)

add_executable(raylib_example main.cpp)
target_compile_definitions(raylib_example PRIVATE PLATFORM_WEB)
target_link_libraries(raylib_example PRIVATE raylib glfw3)
