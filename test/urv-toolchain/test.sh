#!/usr/bin/env bash

set -ex

cd $(dirname "$0")

git clone --recursive https://ohwr.org/project/wrpc-sw

cd wrpc-sw

make spec_defconfig

make

mv wrc.vhd  ../../..
mv wrc.bin  ../../..
mv wrc.bram ../../..

cd ..

git clone --recursive https://ohwr.org/project/urv-core

cd urv-core

make ARCH="rv32g" -C sw/hello

mv sw/hello/main.o ../../..






