cmake_minimum_required(VERSION 3.0)
project(emp-ffi)
set(NAME "emp-ffi")

find_package(emp-tool REQUIRED)
find_package(emp-ot REQUIRED)
find_package(emp-sh2pc REQUIRED)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_C_FLAGS "-O3")
set(CMAKE_CXX_FLAGS ${CMAKE_C_FLAGS})

add_library(${NAME} SHARED emp-ffi.cpp)

target_link_libraries(${NAME} ${EMP-TOOL_LIBRARIES})

target_include_directories(${NAME} PUBLIC ${EMP-TOOL_INCLUDE_DIRS})

install(FILES emp-ffi.h DESTINATION include)
install(TARGETS ${NAME} DESTINATION lib)
