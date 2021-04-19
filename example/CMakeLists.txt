
cmake_minimum_required(VERSION 3.2)

project(nanosvg-examples)

set(INSTPREFIX ${CMAKE_CURRENT_BINARY_DIR}/inst CACHE PATH "" FORCE)
set(CMAKE_PREFIX_PATH ${INSTPREFIX} CACHE PATH "" FORCE)

include(ExternalProject)

ExternalProject_Add(
    nanosvg
    PREFIX ${INSTPREFIX}
    DOWNLOAD_COMMAND ""
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ${CMAKE_COMMAND} -S ${CMAKE_CURRENT_SOURCE_DIR}/.. -B . -DCMAKE_DEBUG_POSTFIX=_dbg
    BUILD_COMMAND ${CMAKE_COMMAND} --build . --config Debug
    TEST_COMMAND ""
    INSTALL_COMMAND ${CMAKE_COMMAND} --install . --config Debug --prefix ${INSTPREFIX}
    BUILD_IN_SOURCE ON
)

ExternalProject_Add(
    glfw3
    URL https://github.com/glfw/glfw/archive/refs/tags/3.3.4.zip
    URL_HASH SHA256=19a1048439a35e49f9b48fbe2e42787cfabae70df80ffd096b3b553bbd8a09f7
    PREFIX ${INSTPREFIX}
    UPDATE_COMMAND ""
    BUILD_COMMAND ${CMAKE_COMMAND} --build . --config Debug
    TEST_COMMAND ""
    INSTALL_COMMAND ${CMAKE_COMMAND} --install . --prefix ${INSTPREFIX} --config Debug
    CMAKE_ARGS -DGLFW_BUILD_DOCS=OFF -DGLFW_BUILD_TESTS=OFF -DGLFW_BUILD_EXAMPLES=OFF -DBUILD_SHARED_LIBS=OFF -DCMAKE_DEBUG_POSTFIX=_dbg
    BUILD_IN_SOURCE ON
)

if(NOT BUILD_DEPS_ONLY)
    find_package(glfw3 REQUIRED)
    find_package(nanosvg REQUIRED)

    if(CYGWIN)
        set(OPENGL_LIBRARIES /usr/bin/cygGL-1.dll /usr/bin/cygGLU-1.dll)
    else()
        find_package(OpenGL REQUIRED)
    endif()

    add_executable(example1 example1.c)
    target_include_directories(example1 PRIVATE ${OPENGL_INCLUDE_DIR})
    target_link_libraries(example1 PRIVATE nanosvg::nanosvg glfw ${OPENGL_LIBRARIES})
    set_target_properties(example1 PROPERTIES VS_DEBUGGER_WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}")

    add_executable(example2 example2.c)
    target_include_directories(example2 PRIVATE ${OPENGL_INCLUDE_DIR})
    target_link_libraries(example2 PRIVATE nanosvg::nanosvg glfw ${OPENGL_LIBRARIES})
    set_target_properties(example2 PROPERTIES VS_DEBUGGER_WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}")

    message(STATUS "Don't leave the example directory when starting the example executables!")
endif()