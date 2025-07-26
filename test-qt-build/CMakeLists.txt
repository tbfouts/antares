cmake_minimum_required(VERSION 3.16)
project(QtHelloWorld)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Core)

add_executable(QtHelloWorld main.cpp)

target_link_libraries(QtHelloWorld Qt6::Core)

# Print Qt information during build
message(STATUS "Qt version: ${Qt6_VERSION}")
message(STATUS "Qt installation path: ${Qt6_DIR}")
message(STATUS "Qt Core found: ${Qt6Core_FOUND}")