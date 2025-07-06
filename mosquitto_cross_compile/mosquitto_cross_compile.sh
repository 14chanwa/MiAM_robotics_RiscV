# Source : https://forum.sophgo.com/t/cross-compile-mosquitto-to-make-duo-an-intelligent-home-mqtt-server/354

mkdir /milkv_workspace/build/cJSON
mkdir /milkv_workspace/build/openssl
mkdir /milkv_workspace/build/mosquitto
mkdir /milkv_workspace/build/install

# Cross compile cJSON
cd /milkv_workspace/build/cJSON
cmake ../../src/MiAM_robotics_RiscV/mosquitto_cross_compile/cJSON/ -DENABLE_CJSON_UTILS=On -DENABLE_CJSON_TEST=Off -DBUILD_SHARED_AND_STATIC_LIBS=On -DCMAKE_INSTALL_PREFIX=$(pwd)/../install
make -j8
make install

# Cross compile OpenSSL
cd /milkv_workspace/build/openssl
../../src/MiAM_robotics_RiscV/mosquitto_cross_compile/openssl/Configure linux64-riscv64 shared no-asm --prefix=$(pwd)/../install CROSS_COMPILE=${HOST_TOOLS_DIR}/gcc/riscv64-linux-musl-x86_64/bin/riscv64-unknown-linux-musl-
make -j8
make install

# Cross compile mosquitto
cd /milkv_workspace/build/mosquitto
cmake ../../src/MiAM_robotics_RiscV/mosquitto_cross_compile/mosquitto -DCMAKE_INSTALL_PREFIX=$(pwd)/../install
make -j8
make install

# Copy the contents of the install library to / on the duo

# Copy the mosquitto configuration file to 
# /etc/mosquitto/mosquitto.conf

# Edit /mnt/system/blink.sh to add
# nohup mosquitto -c /etc/mosquitto/mosquitto.conf -v &

# Set the mac address to a static one
# echo "pre-up ifconfig eth0 hw ether BE:B1:7F:65:59:D5" >> /etc/network/interfaces