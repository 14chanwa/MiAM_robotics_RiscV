FROM ubuntu:22.04
# Configure base system
RUN apt-get update &&\
    DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install wget git make cmake

RUN cd / &&\
    git clone --depth 1 https://github.com/milkv-duo/duo-examples.git &&\
    git clone --depth 1 https://github.com/milkv-duo/host-tools.git

RUN echo 'export HOST_TOOLS_DIR=/host-tools' >> ~/.bashrc &&\
    echo 'export WIRINGX_LIB_DIR=/duo-examples/libs/system/musl_riscv64' >> ~/.bashrc &&\
    echo 'export WIRINGX_INCLUDE_DIR=/duo-examples/include/system' >> ~/.bashrc

RUN mkdir /milkv_workspace

WORKDIR /milkv_workspace