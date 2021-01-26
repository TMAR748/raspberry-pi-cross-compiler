cmake_minimum_required (VERSION 2.8.11)
project (HELLO)

find_package(Threads REQUIRED)

add_executable(hello_world.o hello_world.cpp)
