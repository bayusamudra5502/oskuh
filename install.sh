#!/bin/bash

echo "Install semua requirements.."

GCC_DOWNLOAD="https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/11.1.0/x86_64-gcc-11.1.0-nolibc-i386-linux.tar.xz"

mkdir -p .builder
sudo apt install build-essential xorriso mtools qemu-system qemu xz-utils -y

wget -O /tmp/gcc_cc.tar.xz $GCC_DOWNLOAD

mkdir -p /tmp/gcc_cc
tar -xf /tmp/gcc_cc.tar.xz -C /tmp/gcc_cc

cp -rf /tmp/gcc_cc/gcc-11.1.0-nolibc/i386-linux/ .builder

echo "Well Done, sudah terinstall.."