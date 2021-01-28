#!/bin/bash

# Check for params
if [ $# -ne 1 ] || [ ! -d $1 ]; then
	echo 1>&2 "Usage: $0 PROJECT_FOLDER"
	exit 1
fi

# Get current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [ ! -f "$DIR/Toolchain-rpi.cmake.bak" ]; then
	echo 1>&2 "ERROR: $DIR/Toolchain-rpi.cmake.bak does not exist!"
	echo 1>&2 "Download it with: wget https://raw.githubusercontent.com/Pro/raspi-toolchain/master/Toolchain-rpi.cmake"
	exit 1
fi

if [ ! -d $DIR/build ]; then
	mkdir $DIR/build
fi

if [ ! -d "/opt/cross-pi-gcc" ]; then
        echo 1>&2 "ERROR: Toolchain was not found at /opt/cross-pi-gcc."
	echo 1>&2 "Download the toolchain with: wget https://github.com/Pro/raspi-toolchain/releases/latest/download/raspi-toolchain.tar.gz"
	echo 1>&2 "Extract to the proper directory with: sudo tar xfz raspi-toolchain.tar.gz --strip-components=1 -C /opt"
        exit 1
fi

cd $DIR/build

# To get the rootfs which is required here, use:
# rsync -rl --delete-after --safe-links pi@192.168.1.PI:/{lib,usr} $HOME/rpi/rootfs

export RASPBIAN_ROOTFS=$HOME/rpi/rootfs
export PATH=/opt/cross-pi-gcc/bin:/opt/cross-pi-gcc/libexec/gcc/arm-linux-gnueabihf/8.3.0:$PATH
export RASPBERRY_VERSION=1

cmake -DCMAKE_TOOLCHAIN_FILE=$DIR/Toolchain-rpi.cmake.bak -DCMAKE_BUILD_TYPE=RelWithDebInfo $DIR/$1
make -j

