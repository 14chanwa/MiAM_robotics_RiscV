#!/usr/bin/env bash

# This script is meant to be run inside docker: check that.

if ! [ -f /.dockerenv ]; then
   echo "This script must run inside the docker container"
   exit -1
fi

# Create directory structure
cd /milkv_workspace

mkdir -p build/helloworld

# Compile code
cd /milkv_workspace/build/helloworld
cmake /milkv_workspace/src/MiAM_Robotics_RiscV/helloworld -DCMAKE_BUILD_TYPE=Release
make -j8