cmake_minimum_required(VERSION 3.0)
project(emp-ffi)
set(NAME "emp-ffi")

# Copied from emp-toolkit
if (${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
  if(NOT DEFINED OPENSSL_ROOT_DIR)
    IF(${CMAKE_SYSTEM_PROCESSOR} MATCHES "(aarch64)|(arm64)")
      # M1 Apple
      set(OPENSSL_ROOT_DIR "/opt/homebrew/opt/openssl")
      message(STATUS "OPENSSL_ROOT_DIR set to default: ${OPENSSL_ROOT_DIR}")
    ELSE(${CMAKE_SYSTEM_PROCESSOR} MATCHES "(aarch64)|(arm64)")
      # Intel Apple
      set(OPENSSL_ROOT_DIR "/usr/local/opt/openssl")
      message(STATUS "OPENSSL_ROOT_DIR set to default: ${OPENSSL_ROOT_DIR}")
    ENDIF(${CMAKE_SYSTEM_PROCESSOR} MATCHES "(aarch64)|(arm64)" )
  endif()
endif()

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
