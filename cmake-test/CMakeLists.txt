
cmake_minimum_required(VERSION 3.2)

project(nanosvg-test)

find_package(nanosvg REQUIRED)

add_executable(${PROJECT_NAME} main.c)
target_link_libraries(${PROJECT_NAME} PRIVATE nanosvg::nanosvg)
