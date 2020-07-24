cmake_minimum_required(VERSION 3.17.3)

project(minimal-cxx-dll VERSION 2020.0)

add_library(shared SHARED shared.cpp)

add_executable(demo main.cpp)
target_link_libraries(demo shared)