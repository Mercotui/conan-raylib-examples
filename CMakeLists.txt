cmake_minimum_required(VERSION 3.5)

project(raylib-example VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# If you're having any trouble with the commands and their options, uncomment this line:
#set(CMAKE_VERBOSE_MAKEFILE ON)

add_subdirectory(src)
