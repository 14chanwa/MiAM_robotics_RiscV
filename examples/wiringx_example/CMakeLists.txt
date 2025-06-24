cmake_minimum_required(VERSION 3.5)

# Set compiler to arm compiler (cross-compile)
set(CMAKE_C_COMPILER "$ENV{HOST_TOOLS_DIR}/gcc/riscv64-linux-musl-x86_64/bin/riscv64-unknown-linux-musl-gcc")
set(CMAKE_CXX_COMPILER "$ENV{HOST_TOOLS_DIR}/gcc/riscv64-linux-musl-x86_64/bin/riscv64-unknown-linux-musl-g++")

#Configure project
project(WiringXExample)
set(PROJECT_DESCRIPTION "WiringX example for MilkV")

# Set compiler flags.
set(CMAKE_C_FLAGS "-mcpu=c906fdv -march=rv64imafdcv0p7xthead -mcmodel=medany -mabi=lp64d -O3 -DNDEBUG")
set(CMAKE_CXX_FLAGS "-mcpu=c906fdv -march=rv64imafdcv0p7xthead -mcmodel=medany -mabi=lp64d -O3 -DNDEBUG")
set(CMAKE_EXE_LINKER_FLAGS "-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64")

# Include source files from src directory.
file(GLOB_RECURSE MAIN_SOURCES "*.cpp")
set_source_files_properties(${${PROJECT_NAME}_SOURCES} PROPERTIES LANGUAGE CXX )

# wiringX
# Add directory containing the headers.
include_directories($ENV{WIRINGX_INCLUDE_DIR})
find_library(WIRINGX_LIBRARY wiringx HINTS $ENV{WIRINGX_LIB_DIR})

# Set executable target and link libraries.
add_executable(wiringx_example ${MAIN_SOURCES})
target_link_libraries(wiringx_example PUBLIC ${WIRINGX_LIBRARY} )
