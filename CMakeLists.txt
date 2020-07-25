cmake_minimum_required(VERSION 3.17.3)

project(minimal-cxx-dll VERSION 2020.0)

add_library(shared SHARED shared.cpp)
set_target_properties(shared PROPERTIES VERSION ${PROJECT_VERSION})

add_executable(demo main.cpp)
target_link_libraries(demo shared)