#Project version minimum
cmake_minimum_required(VERSION 3.10.2)
#Project name
project(HelloWorld VERSION 1.0.0)
#source files directory
set(Source_Files
"hello_world.cpp"
)
set(ALL_FILES ${Source_Files})
add_executable(${PROJECT_NAME} ${ALL_FILES})
