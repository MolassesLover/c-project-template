cmake_minimum_required(VERSION 3.14)
project(program C)

set(CMAKE_BUILD_RPATH_USE_ORIGIN ON)

set(CMAKE_CXX_STANDARD 98)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_C_STANDARD 90)
set(CMAKE_C_STANDARD_REQUIRED ON)

set(CMAKE_SHARED_LIBRARY_PREFIX "_")
set(CMAKE_STATIC_LIBRARY_PREFIX "_")

set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fPIC")

set(CMAKE_C_COMPILER "musl-clang")

set(CMAKE_FIND_LIBRARY_SUFFIXES ".a")
set(BUILD_SHARED_LIBS OFF)

add_executable(program src/main.c)

target_link_options(program PRIVATE -static-libgcc -static-libstdc++ -static)

target_include_directories(program PRIVATE include)

install(TARGETS program DESTINATION bin)