#!/usr/bin/env bash

# This script is meant to be run inside docker: check that.

if ! [ -f /.dockerenv ]; then
   echo "This script must run inside the docker container"
   exit -1
fi

# Create directory structure
cd /milkv_workspace/src/MiAM_robotics_RiscV/examples

# Compile examples
for example_file in */ ; do 
    example_file="${example_file%/}"     # strip trailing slash
    example_file="${example_file##*/}"   # strip path and leading slash
    echo "$example_file"; 

    mkdir -p "/milkv_workspace/build/examples/$example_file"
    cd "/milkv_workspace/build/examples/$example_file"
    cmake "/milkv_workspace/src/MiAM_robotics_RiscV/examples/$example_file" -DCMAKE_BUILD_TYPE=Release
    make -j8
done
