cmake_minimum_required (VERSION 2.8.11)

project (HELLO) #Project title

find_package(Threads REQUIRED) #Includes Threads package (required)

#configure_file(config.h) #Add header files

add_executable(hello_world.o hello_world.cpp) #First param is output file name
