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

set(PROGRAM_FLAGS_BASE "-O2 -fPIC -Wall -Wextra -Werror -Wno-unused-command-line-argument -Wconversion -Wsign-conversion -fstack-protector-all -fcf-protection=full -mshstk")

set(CMAKE_C_FLAGS "${PROGRAM_FLAGS_BASE}")
set(CMAKE_CXX_FLAGS "${PROGRAM_FLAGS_BASE}")

set(CMAKE_C_COMPILER "musl-clang")

set(CMAKE_FIND_LIBRARY_SUFFIXES ".a")
set(BUILD_SHARED_LIBS OFF)

set(ENTRY
    src/main.c
)

SET(SOURCE_FILES
    src/program.c
)

SET(HEADER_FILES
    include/program.h
)

macro(link_base LINK_TARGET)
    if(NOT BUILD_SHARED_LIBS)
        target_link_options(${LINK_TARGET} PRIVATE -static-libstdc++ -static)
    elseif(BUILD_SHARED_LIBS)
        target_link_options(${LINK_TARGET} PRIVATE -fsanitize=address -fsplit-stack)
    endif()
    
    target_link_options(${LINK_TARGET} PRIVATE -static-libstdc++ -static)
    target_include_directories(${LINK_TARGET} PRIVATE include)
endmacro()

macro(link LINK_TARGET)
    link_base(${LINK_TARGET})
    target_link_libraries(${LINK_TARGET} PRIVATE programlib)
endmacro()

add_library(programlib ${SOURCE_FILES} ${HEADER_FILES})
link_base(programlib)

add_executable(program ${ENTRY})
link(program)

install(TARGETS program DESTINATION bin)