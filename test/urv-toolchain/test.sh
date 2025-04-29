#!/usr/bin/env bash

set -ex

cd $(dirname "$0")

git clone --recursive https://gitlab.com/ohwr/project/wrpc-sw

cd wrpc-sw

make spec_defconfig

make

mv wrc.vhd  ../../..
mv wrc.bin  ../../..
mv wrc.bram ../../..

cd ..

git clone --recursive https://gitlab.com/ohwr/project/urv-core

mv Makefile urv-core/sw/hello

cd urv-core

make -C sw/hello

mv sw/hello/hello.ram ../../..
